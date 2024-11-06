import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'custom_base_response.g.dart';

@JsonSerializable()
@immutable
final class CustomBaseResponse extends INetworkModel<CustomBaseResponse>
    with EquatableMixin {
  const CustomBaseResponse({
    required this.success,
    this.message,
    this.result,
  });

  @override
  factory CustomBaseResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomBaseResponseFromJson(json);
  @override
  CustomBaseResponse fromJson(Map<String, dynamic> json) =>
      CustomBaseResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CustomBaseResponseToJson(this);

  final bool success;
  final String? message;
  final dynamic result;

  @override
  List<Object?> get props => [success, message];
}
