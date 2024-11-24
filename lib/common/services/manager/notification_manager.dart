import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/router/router_provider.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

final notificationProvider = Provider<NotificationManager>((ref) {
  return NotificationManager(ref);
});

class NotificationManager {
  NotificationManager(this.ref) {
    init();
  }
  final Ref ref;

  Future<void> init() async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(ApiKey.osAppID);
    await OneSignal.LiveActivities.setupDefault();

    await OneSignal.Notifications.clearAll();
    final context = ref.read(routerProvider).navigatorKey.currentContext;
    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint(OneSignal.User.pushSubscription.optedIn.toString());
      debugPrint(OneSignal.User.pushSubscription.id);
      debugPrint(OneSignal.User.pushSubscription.token);
      debugPrint(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addClickListener((event) {
      final senderIdString =
          event.notification.additionalData?['sender_id'] as String?;
      final senderId =
          senderIdString != null ? int.tryParse(senderIdString) : null;
      final isMessage =
          event.notification.additionalData?['isMessage'] as bool? ??
              false;
      if (context == null) {
        return;
      }
      if (isMessage) {
        ref.read(routerProvider).pushAndPopUntil(const MessagesRoute(),
            predicate: (_) => false);
      } else {
        context.router.pushAndPopUntil(
            UserProfileRoute(userId: senderId ?? 3),
            predicate: (_) => false);
      }
    });
    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      event.preventDefault();
      event.notification.display();
      final isMessage =
          event.notification.additionalData?['isMessage'] as bool? ??
              false;
      if (isMessage && context != null) {
        showToast(context, isMessage);
      }
    });
  }

  void showToast(BuildContext context, bool isMessage) {
    final snackBar = SnackBar(
      content: Text(
        isMessage
            ? LocaleKeys.newMessageReceived.tr()
            : LocaleKeys.youHaveANewFollower.tr(),
        style: context.textTheme.headlineSmall,
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<Map<String, dynamic>?> sendNotification({
    required String receiverId,
    required String message,
    required String senderId,
    required bool isMessage,
  }) async {
    final requestBody = <String, dynamic>{
      'app_id': ApiKey.osAppID,
      'include_external_user_ids': [receiverId],
      'channel_for_external_user_ids': 'push',
      'contents': {'en': message},
      'data': {'sender_id': senderId, 'isMessage': isMessage},
    };
    final response = await http.post(
      Uri.parse(ApiKey.osPushUrl),
      headers: {
        'Authorization': 'Basic ${ApiKey.osApiKeyValue}',
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    return jsonDecode(response.body) as Map<String, dynamic>?;
  }

  Future<void> login() async {
    final userId = CacheManager.instance.getUserId();
    await OneSignal.login(userId.toString());
    await OneSignal.User.addAlias('userId', userId.toString());
  }

  Future<void> logout() async {
    await OneSignal.logout();
    await OneSignal.User.removeAlias('userId');
  }

  int stringToInt(String str) {
    try {
      return int.parse(str);
    } catch (e) {
      return 0;
    }
  }
}
