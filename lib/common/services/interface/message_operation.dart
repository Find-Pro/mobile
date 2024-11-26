import 'package:findpro/common/services/model/response/chat_rooms_response.dart';
import 'package:findpro/common/services/model/response/start_chat_room_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

abstract class MessageOperation {
  Future<ChatRoomsResponse?> chatRooms();
  Future<StartChatRoomResponse?> startChatRoom(int otherUserId);
  Future<SuccessAndMessageResponse?> deleteRoom(String roomId);
}
