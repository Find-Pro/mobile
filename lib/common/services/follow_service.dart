import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/services/interface/follow_operation.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:vexana/vexana.dart';

class FollowService implements FollowOperation {
  FollowService(INetworkManager<UserModel> networkManager)
      : _networkManager = networkManager;
  final INetworkManager<UserModel> _networkManager;

  @override
  Future<String?> follow(int userId, int followUserId, bool follow) async {
    final response = await _networkManager.send<UserModel, UserModel>(
      EndPointEnums.followFollow.fullUrl,
      parseModel: UserModel(),
      method: RequestType.POST,
      data: {
        'userId': userId,
        'followUserId': followUserId,
        'follow': follow,
      },
    );

    return response.error != null ? null : LocaleKeys.success;
  }

  @override
  Future<List<UserModel>?> following(int userId) async {
    final response =
        await _networkManager.send<UserModel, List<UserModel>>(
      '${EndPointEnums.followFollowing.fullUrl}$userId',
      parseModel: UserModel(),
      method: RequestType.POST,
    );

    return response.data;
  }

  @override
  Future<List<UserModel>?> followers(int userId) async {
    final response =
        await _networkManager.send<UserModel, List<UserModel>>(
      '${EndPointEnums.followFollowers.fullUrl}$userId',
      parseModel: UserModel(),
      method: RequestType.POST,
    );

    return response.data;
  }
}
