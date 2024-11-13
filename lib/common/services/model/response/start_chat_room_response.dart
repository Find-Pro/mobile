import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_chat_room_response.g.dart';
part 'start_chat_room_response.freezed.dart';

@freezed
class StartChatRoomResponse with _$StartChatRoomResponse {
  factory StartChatRoomResponse({
    required bool success,
    @Default('') String? message,
    @Default('') String roomId,
  }) = _StartChatRoomResponse;

  factory StartChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChatRoomResponseFromJson(json);
}
