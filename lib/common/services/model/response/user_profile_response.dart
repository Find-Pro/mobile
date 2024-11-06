import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
@immutable
final class UserProfileResponse extends INetworkModel<UserProfileResponse>
    with EquatableMixin {
  UserProfileResponse({
    required this.success,
    this.message,
    this.user,
  });

  @override
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);
  @override
  UserProfileResponse fromJson(Map<String, dynamic> json) =>
      UserProfileResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserProfileResponseToJson(this);

  final bool success;
  final String? message;
  final UserModel? user;

  @override
  List<Object?> get props => [success, user, message];
}
