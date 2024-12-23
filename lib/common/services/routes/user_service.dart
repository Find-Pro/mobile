import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/user_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/model/response/user_profile_response.dart';

class UserService implements UserOperation {
  UserService._();
  static final UserService instance = UserService._();

  @override
  Future<UserProfileResponse?> profile(int userId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.userProfile,
      data: {'userId': userId},
    );
    return UserProfileResponse.fromJson(responseData!);
  }

  @override
  Future<UpdateProfileResponse?> updateProfile(
    String fullName,
    String email,
  ) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.userUpdate,
      data: {
        'userId': userId,
        'fullName': fullName,
        'email': email,
      },
    );

    return UpdateProfileResponse.fromJson(responseData!);
  }

  @override
  Future<SuccessAndMessageResponse?> updatePassword(
      String password) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.userUpdatePassword,
      data: {
        'userId': userId,
        'password': password,
      },
    );
    return SuccessAndMessageResponse.fromJson(responseData!);
  }

  @override
  Future<SuccessAndMessageResponse?> updateCountry(String country) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.userUpdatePassword,
      data: {
        'userId': userId,
        'country': country,
      },
    );
    return SuccessAndMessageResponse.fromJson(responseData!);
  }

  @override
  Future<SuccessAndMessageResponse?> removeAccount() async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.userRemoveAccount,
      data: {'userId': userId},
    );
    return SuccessAndMessageResponse.fromJson(responseData!);
  }
}
