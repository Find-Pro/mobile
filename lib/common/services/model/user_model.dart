import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
final class UserModel extends INetworkModel<UserModel>
    with EquatableMixin {
  UserModel({
    this.mongoDbId,
    this.userId,
    this.isMaster,
    this.fullName,
    this.email,
    this.ratings,
    this.password,
    this.profilePicture,
    this.coverPicture,
    this.followers,
    this.followings,
    this.createdAt,
    this.updatedAt,
    this.salt,
    this.googleToken,
    this.appleToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @JsonKey(name: '_id')
  final String? mongoDbId;
  final int? userId;
  final bool? isMaster;
  final String? fullName;
  final String? email;
  final List<CommentModel>? ratings;
  final String? password;
  final String? profilePicture;
  final String? coverPicture;
  final List<FollowerModel>? followers;
  final List<FollowerModel>? followings;
  final String? createdAt;
  final String? updatedAt;
  final String? salt;
  final String? googleToken;
  final String? appleToken;

  @override
  UserModel fromJson(Map<String, dynamic> json) =>
      UserModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        mongoDbId,
        userId,
        isMaster,
        fullName,
        email,
        ratings,
        password,
        profilePicture,
        coverPicture,
        followers,
        followings,
        createdAt,
        updatedAt,
        salt,
        googleToken,
        appleToken,
      ];
}
