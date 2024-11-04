import 'dart:io';

import 'package:findpro/common/services/model/response/success_and_message_response.dart';

abstract class PhotoOperation {
  Future<SuccessAndMessageResponse?> profile(int userId, File image);
  Future<SuccessAndMessageResponse?> cover(int userId, File image);
}
