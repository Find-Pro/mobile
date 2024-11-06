import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/follow_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/user_model.dart';

class FollowService implements FollowOperation {
  @override
  Future<SuccessAndMessageResponse?> follow(
      int userId, int followUserId, bool follow) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followFollow,
      data: {
        'userId': userId,
        'followUserId': followUserId,
        'follow': follow,
      },
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<List<UserModel>?> following(int userId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followFollowing,
      data: {'userId': userId},
    );

    return responseData != null
        ? (responseData as List)
            .map(
                (user) => UserModel.fromJson(user as Map<String, dynamic>))
            .toList()
        : null;
  }

  @override
  Future<List<UserModel>?> followers(int userId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followFollowers,
      data: {'userId': userId},
    );

    return responseData != null
        ? (responseData as List)
            .map(
                (user) => UserModel.fromJson(user as Map<String, dynamic>))
            .toList()
        : null;
  }
}
