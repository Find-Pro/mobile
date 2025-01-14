import 'package:findpro/common/const/api_key.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final class PrivacyContractUrlLauncher {
  Future<void> launchPrivacyPolicy() async {
    final emailLaunchUri = Uri.parse(ApiKey.privacyPolicyUrl);
    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
  Future<void> launchTermsOfUse() async {
    final emailLaunchUri = Uri.parse(ApiKey.termsOfUse);
    try {
      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }
}
