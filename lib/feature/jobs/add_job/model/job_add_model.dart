// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_add_model.g.dart';
part 'job_add_model.freezed.dart';

@freezed
class JobAddModel with _$JobAddModel {
  factory JobAddModel({
    @Default(0) int? cityId,
    @Default(0) int? userId,
    @Default(0) int? hourlyWage,
    @Default(0) int? districtId,
    @JsonKey(name: 'jobCategoryId') @Default(0) int? categoryId,
    @JsonKey(name: 'jobServiceId') @Default(0) int? serviceId,
    @Default('') String? description,
    @Default('') String? country,
  }) = _JobAddModel;

  factory JobAddModel.fromJson(Map<String, dynamic> json) =>
      _$JobAddModelFromJson(json);
}
