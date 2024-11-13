import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    @Default(0) int? messageId,
    @Default(0) int? userId,
    @Default(0) int otherUserId,
    @Default('') String message,
    @Default('') String? timestamp,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}
