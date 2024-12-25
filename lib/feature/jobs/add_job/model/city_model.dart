// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.g.dart';
part 'city_model.freezed.dart';

@freezed
class CityModel with _$CityModel {
  factory CityModel({
    @JsonKey(name: 'il_id') required int ilId,
    required String name,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
}
