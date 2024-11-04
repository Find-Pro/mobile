import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/response/update_profile_response.dart';
import 'package:findpro/common/services/model/response/user_list_response.dart';
import 'package:findpro/common/services/model/response/user_profile_response.dart';
import 'package:findpro/common/services/model/user_model.dart';

abstract class UserOperation {
  Future<UserProfileResponse?> profile();
  Future<UpdateProfileResponse?> updateProfile(UserModel updateUser);
  Future<SuccessAndMessageResponse?> updatePassword(String password);
  Future<UserListResponse?> list();
}
