import 'package:findpro/common/services/routes/support_service.dart';

final class SupportViewModel {
  Future<bool> sendSupportRequest(String subject) async {
    final response = await SupportService.instance.general(subject);
    if (response != null && response.success) {
      return true;
    } else {
      return false;
    }
  }
}
