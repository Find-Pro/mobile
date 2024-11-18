import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_number_box_model.g.dart';
part 'follow_number_box_model.freezed.dart';

@freezed
class FollowNumberBoxModel with _$FollowNumberBoxModel {
  factory FollowNumberBoxModel({
    @Default(0) int? followersCount,
    @Default(false) bool? success,
    @Default(0) int? followingCount,
  }) = _FollowNumberBoxModel;

  factory FollowNumberBoxModel.fromJson(Map<String, dynamic> json) =>
      _$FollowNumberBoxModelFromJson(json);
}
