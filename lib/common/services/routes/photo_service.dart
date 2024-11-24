import 'dart:convert';
import 'dart:io';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/photo_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class PhotoService implements PhotoOperation {
  PhotoService._();
  static final PhotoService instance = PhotoService._();
  @override
  Future<SuccessAndMessageResponse?> profile(File image) async {
    return _uploadPhoto(image, EndPointEnums.photoProfile);
  }

  @override
  Future<SuccessAndMessageResponse?> cover(File image) async {
    return _uploadPhoto(image, EndPointEnums.photoCover);
  }

  Future<SuccessAndMessageResponse?> _uploadPhoto(
      File image, EndPointEnums endpoint) async {
    final userId = CacheManager.instance.getUserId();
    final imageBytes = await image.readAsBytes();
    final base64Image = base64Encode(imageBytes);
    final jsonData = {
      'userId': userId,
      'image': base64Image,
    };
    final responseData = await NetworkManager.instance.photoRequest(
      APIRequestMethod.post,
      endpoint,
      data: jsonData,
    );

    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }
}
