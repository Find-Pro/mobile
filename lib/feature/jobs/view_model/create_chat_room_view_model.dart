import 'package:findpro/common/services/message_service.dart';
import 'package:findpro/common/services/model/response/start_chat_room_response.dart';
import 'package:riverpod/riverpod.dart';

class CreateChatRoomViewModel
    extends StateNotifier<StartChatRoomResponse> {
  CreateChatRoomViewModel() : super(StartChatRoomResponse(success: false));

  Future<StartChatRoomResponse> create(int userId) async {
    final response = await MessageService.instance.startChatRoom(userId);
    if (response != null) {
      return response;
    } else {
      return StartChatRoomResponse(success: false);
    }
  }
}

final createChatRoomProvider =
    StateNotifierProvider<CreateChatRoomViewModel, StartChatRoomResponse>(
        (ref) => CreateChatRoomViewModel());
