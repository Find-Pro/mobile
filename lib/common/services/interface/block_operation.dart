import 'package:findpro/common/services/model/response/success_and_message_response.dart';

abstract class BlockOperation {
  Future<SuccessAndMessageResponse?> block(int otherId, bool block);
  Future<List<int>?> list(int userId);
}
