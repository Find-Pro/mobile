import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_job_model.freezed.dart';
part 'string_job_model.g.dart';

@freezed
class StringJobModel with _$StringJobModel {
  factory StringJobModel({
    @Default('') String? city,
    @Default('') String? district,
    @Default('') String? country,
    @Default('') String? category,
    @Default('') String? service,
    @Default('') String? fullName,
    @Default('') String? profilePicture,
    @Default('') String? createdAt,
    @Default('') String? description,
    @Default(0) int? hourlyWage,
    @Default(0) int? jobId,
    @Default(0) int? userId,
    @Default(null) DateTime? expiryDate,
  }) = _StringJobModel;

  factory StringJobModel.fromJson(Map<String, dynamic> json) =>
      _$StringJobModelFromJson(json);
}
