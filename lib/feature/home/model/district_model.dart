import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'district_model.g.dart';

@JsonSerializable()
@immutable
final class DistrictModel extends INetworkModel<DistrictModel>
    with EquatableMixin {
  DistrictModel({
    this.ilId,
    this.id,
    this.name,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  @JsonKey(name: 'il_id')
  final String? ilId;
  final String? name;
  final String? id;

  @override
  DistrictModel fromJson(Map<String, dynamic> json) =>
      DistrictModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$DistrictModelToJson(this);

  @override
  List<Object?> get props => [
        ilId,
        name,
        id,
      ];
}
