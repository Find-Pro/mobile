import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_list_response.g.dart';

@JsonSerializable()
@immutable
final class UserListResponse extends INetworkModel<UserListResponse>
    with EquatableMixin {
  const UserListResponse({
    required this.success,
    this.message,
    this.users,
  });

  @override
  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);

  @override
  UserListResponse fromJson(Map<String, dynamic> json) =>
      UserListResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserListResponseToJson(this);

  final bool success;
  final String? message;
  final List<UserModel>? users;

  @override
  List<Object?> get props => [success, message, users];
}
