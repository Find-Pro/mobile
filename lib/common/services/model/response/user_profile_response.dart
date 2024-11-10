import 'package:findpro/common/services/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.g.dart';
part 'user_profile_response.freezed.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  factory UserProfileResponse({
    required bool success,
    String? message,
    UserModel? user,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
}
