import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/support_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class SupportService implements SupportOperation {
  @override
  Future<SuccessAndMessageResponse?> user(
      int userId, int otherId, String subject) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.supportUser,
      data: {
        'userId': userId,
        'otherId': otherId,
        'subject': subject,
      },
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<SuccessAndMessageResponse?> comment(
      int userId, int otherId, String subject) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.supportComment,
      data: {
        'userId': userId,
        'otherId': otherId,
        'subject': subject,
      },
    );

    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<SuccessAndMessageResponse?> general(
      int userId, String subject) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.supportGeneral,
      data: {
        'userId': userId,
        'subject': subject,
      },
    );

    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }
}
