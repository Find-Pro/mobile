import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'add_comment_request.g.dart';

@JsonSerializable()
@immutable
final class AddCommentRequest extends INetworkModel<AddCommentRequest>
    with EquatableMixin {
  const AddCommentRequest({
    required this.createdByUserId,
    required this.userId,
    required this.commentText,
    required this.rating,
  });

  @override
  factory AddCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCommentRequestFromJson(json);
  @override
  AddCommentRequest fromJson(Map<String, dynamic> json) =>
      AddCommentRequest.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$AddCommentRequestToJson(this);

  final int createdByUserId;
  final int userId;
  final String commentText;
  final int rating;

  @override
  List<Object?> get props => [
        createdByUserId,
        userId,
        commentText,
        rating,
      ];
}
