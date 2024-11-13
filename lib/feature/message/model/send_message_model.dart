import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_message_model.g.dart';
part 'send_message_model.freezed.dart';

@freezed
class SendMessageModel with _$SendMessageModel {
  factory SendMessageModel({
    @Default('sendMessage') String action,
    @Default('') String roomId,
    @Default(0) int messageId,
    @Default(0) int userId,
    @Default(0) int otherUserId,
    @Default('') String message,
    @Default('') String? timestamp,
  }) = _SendMessageModel;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessageModelFromJson(json);
}
