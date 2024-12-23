import 'package:freezed_annotation/freezed_annotation.dart';

part 'string_job_model.g.dart';
part 'string_job_model.freezed.dart';

@freezed
class StringJobModel with _$StringJobModel {
  factory StringJobModel({
    @Default('') String? city,
    @Default('') String? district,
    @Default('') String? country,
    @Default('') String? category,
    @Default('') String? service,
  }) = _StringJobModel;

  factory StringJobModel.fromJson(Map<String, dynamic> json) =>
      _$StringJobModelFromJson(json);
}
