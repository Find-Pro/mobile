import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/support_operation.dart'; // Update import to your new interface
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/support_request_model.dart';
import 'package:vexana/vexana.dart';

class SupportService implements SupportOperation {
  SupportService(this._networkManager);
  final INetworkManager _networkManager;

  @override
  Future<SuccessAndMessageResponse?> user(
      int userId, int otherId, String subject) async {
    final supportRequest = SupportRequestModel(
      userId: userId,
      otherId: otherId,
      subject: subject,
    );

    final response = await _networkManager
        .send<SupportRequestModel, SuccessAndMessageResponse>(
      EndPointEnums.supportUser.fullUrl,
      parseModel: SupportRequestModel(),
      method: RequestType.POST,
      data: supportRequest.toJson(),
    );

    return response.data;
  }

  @override
  Future<SuccessAndMessageResponse?> comment(
      int userId, int otherId, String subject) async {
    final supportRequest = SupportRequestModel(
      userId: userId,
      otherId: otherId,
      subject: subject,
    );

    final response = await _networkManager
        .send<SupportRequestModel, SuccessAndMessageResponse>(
      EndPointEnums.supportComment.fullUrl,
      parseModel: SupportRequestModel(),
      method: RequestType.POST,
      data: supportRequest.toJson(),
    );

    return response.data;
  }

  @override
  Future<SuccessAndMessageResponse?> general(
      int userId, String subject) async {
    final supportRequest = SupportRequestModel(
      userId: userId,
      subject: subject,
    );

    final response = await _networkManager
        .send<SupportRequestModel, SuccessAndMessageResponse>(
      EndPointEnums.supportGeneral.fullUrl,
      parseModel: SupportRequestModel(),
      method: RequestType.POST,
      data: supportRequest.toJson(),
    );
    return response.data;
  }
}
