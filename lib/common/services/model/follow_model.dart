import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'follow_model.g.dart';

@JsonSerializable()
@immutable
final class FollowModel extends Equatable {
  const FollowModel({
    this.userId,
    this.fullName,
    this.profilePicture,
  });

  @override
  factory FollowModel.fromJson(Map<String, dynamic> json) =>
      _$FollowModelFromJson(json);

  final int? userId;
  final String? fullName;
  final String? profilePicture;

  FollowModel fromJson(Map<String, dynamic> json) =>
      FollowModel.fromJson(json);

  Map<String, dynamic>? toJson() => _$FollowModelToJson(this);

  @override
  List<Object?> get props => [userId, fullName, profilePicture];
}
