import 'package:findpro/feature/message/model/room_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_chat_room_response.freezed.dart';
part 'start_chat_room_response.g.dart';

@freezed
class StartChatRoomResponse with _$StartChatRoomResponse {
  factory StartChatRoomResponse({
    required bool success,
    String? message,
    RoomModel? room,
  }) = _StartChatRoomResponse;

  factory StartChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$StartChatRoomResponseFromJson(json);
}
