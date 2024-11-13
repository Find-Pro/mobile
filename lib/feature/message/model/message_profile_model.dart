import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_profile_model.g.dart';
part 'message_profile_model.freezed.dart';

@freezed
class MessageProfileModel with _$MessageProfileModel {
  factory MessageProfileModel({
    @Default('') String? fullName,
    @Default(0) int userId,
    @Default('') String profilePicture,
    @Default('') String roomId,
  }) = _MessageProfileModel;

  factory MessageProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MessageProfileModelFromJson(json);
}
