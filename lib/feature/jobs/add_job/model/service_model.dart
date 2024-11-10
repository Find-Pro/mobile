import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'service_model.g.dart';

@JsonSerializable()
@immutable
final class ServiceModel extends INetworkModel<ServiceModel>
    with EquatableMixin {
  const ServiceModel({
    required this.id,
    required this.name,
  });

  @override
  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
  @override
  ServiceModel fromJson(Map<String, dynamic> json) =>
      ServiceModel.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ServiceModelToJson(this);

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
