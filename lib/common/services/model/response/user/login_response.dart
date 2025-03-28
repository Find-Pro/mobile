import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response.g.dart';

@JsonSerializable()
@immutable
final class LoginResponse extends INetworkModel<LoginResponse>
    with EquatableMixin {
  const LoginResponse({
    required this.success,
    this.message,
    this.user,
  });

  @override
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  LoginResponse fromJson(Map<String, dynamic> json) =>
      LoginResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginResponseToJson(this);

  final bool success;
  final String? message;
  final UserModel? user;

  @override
  List<Object?> get props => [success, message];
}
