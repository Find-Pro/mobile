import 'package:findpro/feature/message/model/room_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_rooms_response.g.dart';
part 'chat_rooms_response.freezed.dart';

@freezed
class ChatRoomsResponse with _$ChatRoomsResponse {
  factory ChatRoomsResponse({
    required bool success,
    @Default('') String? message,
    @Default([]) List<RoomModel?>? rooms,
  }) = _ChatRoomsResponse;

  factory ChatRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomsResponseFromJson(json);
}
