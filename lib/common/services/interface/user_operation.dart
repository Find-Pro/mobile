import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:findpro/common/services/model/response/user/update_profile_response.dart';
import 'package:findpro/common/services/model/response/user/user_profile_response.dart';

abstract class UserOperation {
  Future<UserProfileResponse?> profile(int userId);

  Future<UpdateProfileResponse?> updateProfile(
      String fullName, String email);

  Future<SuccessAndMessageResponse?> updatePassword(String password);

  Future<SuccessAndMessageResponse?> updateCountry(String country);

  Future<SuccessAndMessageResponse?> removeAccount();
}
