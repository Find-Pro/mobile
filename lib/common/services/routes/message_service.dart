import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/message_operation.dart';
import 'package:findpro/common/services/manager/network_manager.dart';
import 'package:findpro/common/services/model/response/comment/chat_rooms_response.dart';
import 'package:findpro/common/services/model/response/message/start_chat_room_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class MessageService implements MessageOperation {
  MessageService._();

  static final MessageService instance = MessageService._();

  @override
  Future<ChatRoomsResponse?> chatRooms() async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.messageChatRooms,
      data: {'userId': userId},
    );
    return responseData != null
        ? ChatRoomsResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<StartChatRoomResponse?> startChatRoom(int otherUserId) async {
    final userId = CacheManager.instance.getUserId();
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.messageStartChatRoom,
      data: {
        'userId': userId.toString(),
        'otherUserId': otherUserId.toString(),
      },
    );
    return responseData != null
        ? StartChatRoomResponse.fromJson(responseData)
        : null;
  }

  @override
  Future<SuccessAndMessageResponse?> deleteRoom(String roomId) async {
    final responseData = await NetworkManager.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.messageDeleteRoom,
      data: {
        'roomId': roomId,
      },
    );
    return responseData != null
        ? SuccessAndMessageResponse.fromJson(responseData)
        : null;
  }
}
