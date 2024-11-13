import 'dart:convert';
import 'dart:io';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/router/router_provider.dart';
import 'package:findpro/feature/message/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:onesignal_flutter/onesignal_flutter.dart';

final notificationProvider = Provider<NotificationManager>((ref) {
  return NotificationManager(ref);
});

class NotificationManager {
  NotificationManager(this.ref) {
    getDeviceName();
    initPlatformState();
  }
  final Ref ref;
  String deviceName = '';

  Future<void> initPlatformState() async {
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(ApiKey.appID);
    await OneSignal.LiveActivities.setupDefault();
    await OneSignal.Notifications.clearAll();

    OneSignal.User.pushSubscription.addObserver((state) {
      debugPrint(OneSignal.User.pushSubscription.optedIn.toString());
      debugPrint(OneSignal.User.pushSubscription.id);
      debugPrint(OneSignal.User.pushSubscription.token);
      debugPrint(state.current.jsonRepresentation());
    });

    OneSignal.User.addObserver((state) {
      final userState = state.jsonRepresentation();
      debugPrint('OneSignal user changed: $userState');
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      debugPrint('Has permission $state');
    });

    OneSignal.Notifications.addClickListener((event) {
      debugPrint('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      event.preventDefault();
      event.notification.display();
    });

    OneSignal.InAppMessages.addClickListener((event) {});
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      debugPrint(
          'ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}');
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      debugPrint(
          'ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}');
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      debugPrint(
          'ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}');
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      debugPrint(
          'ON DID DISMISS IN APP MESSAGE ${event.message.messageId}');
    });
    // oneSignalInAppMessagingTriggerExamples();
    //  oneSignalOutcomeExamples();
    await OneSignal.InAppMessages.paused(true);
  }
  // oneSignalInAppMessagingTriggerExamples((event) ){}

  void navigateToMessages() {
    ref.read(routerProvider).navigate(const MessagesRoute());
  }

  Future<void> reloadChatAndMessages() async {
    final chatViewState = ref
        .read(routerProvider)
        .navigatorKey
        .currentContext
        ?.findAncestorStateOfType<ChatViewState>();
    final messageViewState =
        ref.read(routerProvider).navigatorKey.currentContext;
    if (messageViewState != null && chatViewState != null) {
      // messageViewState.getUsers();
    }
  }

  Future<String> getDeviceName() async {
    if (Platform.isAndroid) {
      return deviceName;
    } else if (Platform.isIOS) {
      return deviceName;
    }
    return deviceName;
  }

  Future<Map<String, dynamic>?> sendNotification(
    String receiverId,
    String message,
    String senderId,
    bool isMessage,
  ) async {
    final requestBody = <String, dynamic>{
      'app_id': ApiKey.appID,
      'include_external_user_ids': [receiverId],
      'channel_for_external_user_ids': 'push',
      'contents': {'en': message},
      'data': {'sender_id': senderId, 'isMessage': isMessage}
    };
    final response = await http.post(
      Uri.parse(ApiKey.osApiKey),
      headers: {
        'Authorization': 'Basic ${ApiKey.osMyRestApi}',
        'accept': 'application/json',
        'content-type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    return jsonDecode(response.body) as Future<Map<String, dynamic>>;
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
