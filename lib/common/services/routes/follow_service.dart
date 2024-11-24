import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/follow_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/follow_list_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/feature/profile/model/follow_number_box_model.dart';

class FollowService implements FollowOperation {
  FollowService._();
  static final FollowService instance = FollowService._();
  @override
  Future<SuccessAndMessageResponse?> follow(
      int userId, int followUserId, bool follow) async {
    final responseData = await NetworkManager.instance.baseRequest(
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
  Future<FollowListResponse?> following(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followFollowing,
      data: {'userId': userId},
    );

    return responseData != null
        ? FollowListResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<FollowListResponse?> followers(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followFollowers,
      data: {'userId': userId},
    );

    return responseData != null
        ? FollowListResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<FollowNumberBoxModel?> count(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.followCount,
      data: {'userId': userId},
    );

    return responseData != null
        ? FollowNumberBoxModel.fromJson(responseData)
        : null;
  }
}
