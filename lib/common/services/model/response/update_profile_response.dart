import 'package:equatable/equatable.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'update_profile_response.g.dart';

@JsonSerializable()
@immutable
final class UpdateProfileResponse
    extends INetworkModel<UpdateProfileResponse> with EquatableMixin {
  const UpdateProfileResponse({
    this.success,
    this.message,
    this.user,
  });

  @override
  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileResponseFromJson(json);
  @override
  UpdateProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse.fromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UpdateProfileResponseToJson(this);

  final bool? success;
  final String? message;
  final UserModel? user;

  @override
  List<Object?> get props => [success, message, user];
}
