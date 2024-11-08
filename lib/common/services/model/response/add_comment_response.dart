import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'add_comment_response.g.dart';

@JsonSerializable()
@immutable
final class AddCommentResponse extends INetworkModel<AddCommentResponse>
    with EquatableMixin {
  const AddCommentResponse({
    required this.success,
    this.result,
    this.message,
  });

  @override
  factory AddCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCommentResponseFromJson(json);
  @override
  AddCommentResponse fromJson(Map<String, dynamic> json) =>
      AddCommentResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AddCommentResponseToJson(this);

  final bool success;
  final String? message;
  final CommentModel? result;

  @override
  List<Object?> get props => [success, message, result];
}
