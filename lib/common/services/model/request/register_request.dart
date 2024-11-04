import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_request.g.dart';

@JsonSerializable()
@immutable
final class RegisterRequest extends INetworkModel<RegisterRequest>
    with EquatableMixin {
  const RegisterRequest({
    this.email,
    this.password,
    this.isMaster,
    this.fullName,
  });

  @override
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  @override
  RegisterRequest fromJson(Map<String, dynamic> json) =>
      RegisterRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RegisterRequestToJson(this);

  final String? email;
  final String? fullName;
  final bool? isMaster;
  final String? password;

  @override
  List<Object?> get props => [
        password,
        email,
        isMaster,
        password,
      ];
}
