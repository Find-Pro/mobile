import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/init/app_localization.dart';
import 'package:findpro/common/services/manager/ad_manager.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await dotenv.load();
  if (!kIsWeb && !Platform.isWindows) {
    await UnityAds.init(
      gameId: AdManager.gameId,
    );
    debugPrint('Unity Ads Initialized Successfully!');
  }

  await CacheManager.instance.init();
  final container = ProviderContainer();
  await container.read(notificationProvider).init();
  runApp(
    AppLocalization(
      child: ProviderScope(
        child: await builder(),
      ),
    ),
  );
}
