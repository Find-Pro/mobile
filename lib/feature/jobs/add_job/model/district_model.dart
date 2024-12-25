// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.g.dart';
part 'district_model.freezed.dart';

@freezed
class DistrictModel with _$DistrictModel {
  factory DistrictModel({
    @JsonKey(name: 'il_id') required int ilId,
    required String name,
    required int id,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
}
