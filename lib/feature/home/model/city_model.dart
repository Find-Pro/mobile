import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'city_model.g.dart';

@JsonSerializable()
@immutable
final class CityModel extends INetworkModel<CityModel>
    with EquatableMixin {
  CityModel({
    this.ilId,
    this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  @JsonKey(name: 'il_id')
  final String? ilId;
  final String? name;

  @override
  CityModel fromJson(Map<String, dynamic> json) =>
      CityModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CityModelToJson(this);

  @override
  List<Object?> get props => [
        ilId,
        name,
      ];
}
