// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.g.dart';
part 'job_model.freezed.dart';

@freezed
class JobModel with _$JobModel {
  factory JobModel({
    @JsonKey(name: '_id') String? mongoDbId,
    int? jobId,
    int? userId,
    DateTime? expiryDate,
    String? country,
    int? jobCategoryId,
    int? cityId,
    int? districtId,
    int? hourlyWage,
    int? jobServiceId,
    String? description,
    bool? isCompleted,
    String? createdAt,
    String? updatedAt,
    String? fullName,
    String? profilePicture,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
