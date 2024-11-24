import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

final class LaunchSupportMail {
  Future<void> launch() async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'findprodestek@gmail.com',
    );
    try {
      await launchUrl(emailLaunchUri);
    } catch (e) {
      Logger().e(e);
    }
  }
}
