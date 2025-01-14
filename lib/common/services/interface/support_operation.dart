import 'package:findpro/common/services/model/response/success_and_message_response.dart';

abstract class SupportOperation {
  Future<SuccessAndMessageResponse?> user(int otherId, String subject);
  Future<SuccessAndMessageResponse?> comment(int otherId, String subject);
  Future<SuccessAndMessageResponse?> general(String subject);
}
