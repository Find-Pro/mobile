import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

final class LaunchAdUrl {
  Future<void> launch() async {
    final uri = Uri(
      path: LocaleKeys.unityAdUrl,
    );
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
