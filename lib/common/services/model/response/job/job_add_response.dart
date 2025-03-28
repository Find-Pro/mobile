import 'package:equatable/equatable.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'job_add_response.g.dart';

@JsonSerializable()
@immutable
class JobAddResponse extends INetworkModel<JobAddResponse>
    with EquatableMixin {
  const JobAddResponse({
    required this.success,
    this.result,
    this.message,
  });

  @override
  factory JobAddResponse.fromJson(Map<String, dynamic> json) =>
      _$JobAddResponseFromJson(json);

  @override
  JobAddResponse fromJson(Map<String, dynamic> json) =>
      JobAddResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$JobAddResponseToJson(this);

  final bool success;
  final String? message;
  final JobModel? result;

  @override
  List<Object?> get props => [success, result, message];
}
