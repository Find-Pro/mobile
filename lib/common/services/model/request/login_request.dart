import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request.g.dart';

@JsonSerializable()
@immutable
final class LoginRequest extends INetworkModel<LoginRequest>
    with EquatableMixin {
  const LoginRequest({
    this.email,
    this.password,
  });

  @override
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  @override
  LoginRequest fromJson(Map<String, dynamic> json) =>
      LoginRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LoginRequestToJson(this);

  final String? email;
  final String? password;

  @override
  List<Object?> get props => [password, email];
}
