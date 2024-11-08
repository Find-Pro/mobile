import 'package:equatable/equatable.dart';
import 'package:findpro/feature/add_job/model/job_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'job_edit_response.g.dart';

@JsonSerializable()
@immutable
final class JobEditResponse extends INetworkModel<JobEditResponse>
    with EquatableMixin {
  const JobEditResponse({
    required this.success,
    this.message,
    this.job,
  });

  @override
  factory JobEditResponse.fromJson(Map<String, dynamic> json) =>
      _$JobEditResponseFromJson(json);
  @override
  JobEditResponse fromJson(Map<String, dynamic> json) =>
      JobEditResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JobEditResponseToJson(this);

  final bool success;
  final String? message;
  final JobModel? job;

  @override
  List<Object?> get props => [success, message, job];
}
