import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'follower_model.g.dart';

@JsonSerializable()
@immutable
final class FollowerModel extends INetworkModel<FollowerModel>
    with EquatableMixin {
  const FollowerModel({
    this.userId,
    this.fullName,
    this.profilePicture,
  });

  @override
  factory FollowerModel.fromJson(Map<String, dynamic> json) =>
      _$FollowerModelFromJson(json);
  @override
  FollowerModel fromJson(Map<String, dynamic> json) =>
      FollowerModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FollowerModelToJson(this);

  final int? userId;
  final String? fullName;
  final String? profilePicture;

  @override
  List<Object?> get props => [userId, fullName, profilePicture];
}
