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
    this.fullName,
    this.profilePicture,
    this.jobId,
    this.userId,
    this.jobCategory,
    this.jobService,
    this.city,
    this.district,
    this.jobCategoryId,
    this.cityId,
    this.jobServiceId,
    this.districtId,
    this.description,
    this.isCompleted,
    this.createdAt,
    this.hourlyWage,
    this.expiryDate,
    this.updatedAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
  @JsonKey(name: '_id')
  final String? mongoDbId;
  final int? jobId;
  final int? userId;
  final String? jobCategory;
  final DateTime? expiryDate;
  final String? city;
  final String? district;
  final String? jobService;
  final int? jobCategoryId;
  final int? cityId;
  final int? districtId;
  final int? hourlyWage;
  final int? jobServiceId;
  final String? description;
  final bool? isCompleted;
  final String? createdAt;
  final String? updatedAt;
  final String? fullName;
  final String? profilePicture;

  @override
  JobModel fromJson(Map<String, dynamic> json) => JobModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JobModelToJson(this);

  @override
  List<Object?> get props => [
        mongoDbId,
        jobId,
        hourlyWage,
        userId,
        profilePicture,
        expiryDate,
        fullName,
        jobCategory,
        city,
        district,
        jobService,
        jobServiceId,
        jobCategoryId,
        cityId,
        districtId,
        description,
        isCompleted,
        createdAt,
        updatedAt,
      ];
}
