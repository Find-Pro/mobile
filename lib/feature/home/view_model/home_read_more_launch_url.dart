import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeReadMoreLaunchUrl {
  Future<void> launch() async {
    final uri = Uri(
      path: 'https://duo-root-software.onrender.com/',
    );
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
