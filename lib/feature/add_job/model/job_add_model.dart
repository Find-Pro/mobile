import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'job_add_model.g.dart';

@JsonSerializable()
@immutable
final class JobAddModel extends INetworkModel<JobAddModel>
    with EquatableMixin {
  JobAddModel({
    this.cityId,
    this.districtId,
    this.userId,
    this.categoryId,
    this.serviceId,
    this.description,
  });

  factory JobAddModel.fromJson(Map<String, dynamic> json) =>
      _$JobAddModelFromJson(json);

  final int? cityId;
  final int? userId;
  final int? districtId;
  @JsonKey(name: 'jobCategoryId')
  final int? categoryId;
  @JsonKey(name: 'jobServiceId')
  final int? serviceId;
  final String? description;

  JobAddModel copyWith({
    int? cityId,
    int? districtId,
    int? categoryId,
    int? serviceId,
    String? description,
  }) {
    return JobAddModel(
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      categoryId: categoryId ?? this.categoryId,
      serviceId: serviceId ?? this.serviceId,
      description: description ?? this.description,
    );
  }

  @override
  JobAddModel fromJson(Map<String, dynamic> json) =>
      JobAddModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JobAddModelToJson(this);

  @override
  List<Object?> get props => [
        cityId,
        description,
        serviceId,
        categoryId,
        districtId,
      ];
}
