import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_list_response.freezed.dart';
part 'follow_list_response.g.dart';

@freezed
class FollowListResponse with _$FollowListResponse {
  factory FollowListResponse({
    @Default(false) bool? success,
    @Default('') String? message,
    @Default([]) List<FollowerModel>? result,
  }) = _FollowListResponse;

  factory FollowListResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowListResponseFromJson(json);
}
