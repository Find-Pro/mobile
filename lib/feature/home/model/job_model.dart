import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'job_model.g.dart';

@JsonSerializable()
@immutable
final class JobModel extends INetworkModel<JobModel> with EquatableMixin {
  JobModel({
    this.mongoDbId,
    this.jobId,
    this.userId,
    this.jobCategory,
    this.city,
    this.district,
    this.jobTitle,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
  @JsonKey(name: '_id')
  final String? mongoDbId;
  final int? jobId;
  final int? userId;
  final String? jobCategory;
  final String? city;
  final String? district;
  final String? jobTitle;
  final String? description;
  final bool? isCompleted;
  final String? createdAt;
  final String? updatedAt;

  @override
  JobModel fromJson(Map<String, dynamic> json) => JobModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JobModelToJson(this);

  @override
  List<Object?> get props => [
        mongoDbId,
        jobId,
        userId,
        jobCategory,
        city,
        district,
        jobTitle,
        description,
        isCompleted,
        createdAt,
        updatedAt,
      ];
}
