import 'package:auto_route/auto_route.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final notificationPermission = await Permission.notification.status;
    if (notificationPermission.isGranted ||
        await Permission.notification.request().isGranted) {
      resolver.next();
    } else {
      resolver.next();
    }
  }
}
