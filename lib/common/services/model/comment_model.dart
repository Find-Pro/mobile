// ignore_for_file: invalid_annotation_target

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'comment_model.g.dart';

@JsonSerializable()
@immutable
final class CommentModel extends INetworkModel<CommentModel>
    with EquatableMixin {
  CommentModel({
    this.mongoDbId,
    this.commentId,
    this.createdByUserId,
    this.userId,
    this.commentText,
    this.isActive,
    this.fullName,
    this.profilePhoto,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  @JsonKey(name: '_id')
  final String? mongoDbId;
  final int? commentId;
  final int? createdByUserId;
  final int? userId;
  final String? commentText;
  final bool? isActive;
  final String? fullName;
  final String? profilePhoto;
  final int? rating;
  final String? createdAt;
  final String? updatedAt;

  @override
  CommentModel fromJson(Map<String, dynamic> json) =>
      CommentModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CommentModelToJson(this);

  @override
  List<Object?> get props => [
        mongoDbId,
        commentId,
        createdByUserId,
        userId,
        commentText,
        isActive,
        fullName,
        profilePhoto,
        rating,
        createdAt,
        updatedAt,
      ];
}
