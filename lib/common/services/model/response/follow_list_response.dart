import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/follow_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'follow_list_response.g.dart';

@JsonSerializable()
@immutable
final class FollowListResponse extends INetworkModel<FollowListResponse>
    with EquatableMixin {
  const FollowListResponse({
    required this.success,
    this.message,
    this.result,
  });

  @override
  factory FollowListResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowListResponseFromJson(json);

  final bool success;
  final String? message;
  final List<FollowModel?>? result;

  @override
  FollowListResponse fromJson(Map<String, dynamic> json) =>
      FollowListResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$FollowListResponseToJson(this);

  @override
  List<Object?> get props => [success, message];
}
