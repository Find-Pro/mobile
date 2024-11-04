import 'dart:io';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/photo_operation.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:vexana/vexana.dart';

class PhotoService implements PhotoOperation {
  PhotoService(this._networkManager);
  final INetworkManager _networkManager;

  @override
  Future<SuccessAndMessageResponse?> profile(
      int userId, File image) async {
    final formData = FormData.fromMap({
      'userId': userId.toString(),
      'profilePicture': await MultipartFile.fromFile(image.path),
    });

    final response = await _networkManager
        .send<SuccessAndMessageResponse, SuccessAndMessageResponse>(
      EndPointEnums.photosProfile.fullUrl,
      parseModel: const SuccessAndMessageResponse(),
      method: RequestType.POST,
      data: formData,
    );

    return response.data;
  }

  @override
  Future<SuccessAndMessageResponse?> cover(int userId, File image) async {
    final formData = FormData.fromMap({
      'userId': userId.toString(),
      'coverPicture': await MultipartFile.fromFile(image.path),
    });

    final response = await _networkManager
        .send<SuccessAndMessageResponse, SuccessAndMessageResponse>(
      EndPointEnums.photosCover.fullUrl,
      parseModel: const SuccessAndMessageResponse(),
      method: RequestType.POST,
      data: formData,
    );

    return response.data;
  }
}
