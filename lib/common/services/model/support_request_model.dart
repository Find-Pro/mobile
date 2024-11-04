// ignore_for_file: invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'support_request_model.g.dart';

@JsonSerializable()
@immutable
final class SupportRequestModel extends INetworkModel<SupportRequestModel>
    with EquatableMixin {
  SupportRequestModel({
    this.userId,
    this.otherId,
    this.subject,
  });

  factory SupportRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SupportRequestModelFromJson(json);

  final int? userId;
  final int? otherId;
  final String? subject;

  @override
  SupportRequestModel fromJson(Map<String, dynamic> json) =>
      SupportRequestModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SupportRequestModelToJson(this);

  @override
  List<Object?> get props => [
        userId,
        otherId,
        subject,
      ];
}
