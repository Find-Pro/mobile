import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'success_and_message_response.g.dart';

@JsonSerializable()
@immutable
final class SuccessAndMessageResponse
    extends INetworkModel<SuccessAndMessageResponse> with EquatableMixin {
  const SuccessAndMessageResponse({
    required this.success,
    this.message,
  });

  @override
  factory SuccessAndMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessAndMessageResponseFromJson(json);
  @override
  SuccessAndMessageResponse fromJson(Map<String, dynamic> json) =>
      SuccessAndMessageResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() =>
      _$SuccessAndMessageResponseToJson(this);

  final bool success;
  final String? message;

  @override
  List<Object?> get props => [success, message];
}
