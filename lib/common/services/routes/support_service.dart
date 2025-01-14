import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/support_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class SupportService implements SupportOperation {
  SupportService._();
  static final SupportService instance = SupportService._();
  @override
  Future<SuccessAndMessageResponse?> user(
      int otherId, String subject) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
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
      int otherId, String subject) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
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
  Future<SuccessAndMessageResponse?> general(String subject) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
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
