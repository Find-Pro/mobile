import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'get_comments_response.g.dart';

@JsonSerializable()
@immutable
final class GetCommentsResponse extends INetworkModel<GetCommentsResponse>
    with EquatableMixin {
  const GetCommentsResponse({
    this.success,
    this.message,
    this.comments,
  });

  @override
  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);
  @override
  GetCommentsResponse fromJson(Map<String, dynamic> json) =>
      GetCommentsResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$GetCommentsResponseToJson(this);

  final bool? success;
  final String? message;
  final List<CommentModel?>? comments;

  @override
  List<Object?> get props => [success, message];
}
