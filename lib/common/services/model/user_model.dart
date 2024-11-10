// ignore_for_file: invalid_annotation_target

import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @JsonKey(name: '_id') String? mongoDbId,
    @Default(0) int? userId,
    @Default(false) bool? isMaster,
    @Default('') String? fullName,
    @Default('') String? email,
    @Default([]) List<CommentModel>? ratings,
    @Default('') String? password,
    @Default('') String? profilePicture,
    @Default('') String? coverPicture,
    @Default([]) List<FollowerModel>? followers,
    @Default([]) List<FollowerModel>? followings,
    @Default('') String? createdAt,
    @Default('') String? updatedAt,
    @Default('') String? salt,
    @Default('') String? googleToken,
    @Default('') String? appleToken,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
