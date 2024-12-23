// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:findpro/feature/jobs/add_job/model/service_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category_model.g.dart';

@JsonSerializable()
@immutable
final class CategoryModel extends INetworkModel<CategoryModel>
    with EquatableMixin {
  CategoryModel({
    required this.id,
    required this.services,
    required this.name,
  });

  @override
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  @override
  CategoryModel fromJson(Map<String, dynamic> json) =>
      CategoryModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CategoryModelToJson(this);

  final int id;
  String name;
  final List<ServiceModel> services;

  @override
  List<Object?> get props => [id, name, services];
}
