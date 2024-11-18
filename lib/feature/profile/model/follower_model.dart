// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'follower_model.g.dart';
part 'follower_model.freezed.dart';

@freezed
class FollowerModel with _$FollowerModel {
  factory FollowerModel({
    @Default(0) int? userId,
    @JsonKey(name: '_id') String? mongoDbId,
    @Default('') String? fullName,
    @Default('') String? profilePicture,
  }) = _FollowerModel;

  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);
}
