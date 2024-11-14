import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/model/response/user_list_response.dart';
import 'package:findpro/common/services/model/response/user_profile_response.dart';

abstract class UserOperation {
  Future<UserProfileResponse?> profile(int userId);
  Future<UpdateProfileResponse?> updateProfile(
      String fullName, String email);
  Future<SuccessAndMessageResponse?> updatePassword(String password);
  Future<UserListResponse?> list();
  Future<SuccessAndMessageResponse?> removeAccount();
}
