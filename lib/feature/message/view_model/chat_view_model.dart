import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/message_service.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:riverpod/riverpod.dart';

class ChatViewModel extends StateNotifier<MessageProfileModel> {
  ChatViewModel() : super(MessageProfileModel());

  Future<bool> getChatRoom(int otherUserId) async {
    final currentUserId = CacheManager.instance.getUserId();
    final res = await MessageService.instance.startChatRoom(otherUserId);

    if (res != null && res.success && res.room != null) {
      final room = res.room!;
      final roomIdParts = room.roomId.split('_');

      if (roomIdParts.length == 2) {
        final myId = currentUserId;
        final otherId = int.parse(roomIdParts[0]) == myId
            ? int.parse(roomIdParts[1])
            : int.parse(roomIdParts[0]);

        final hostProfile = room.hostProfile;
        final guestProfile = room.guestProfile;

        if (hostProfile.userId == otherId) {
          state = MessageProfileModel(
            userId: hostProfile.userId,
            fullName: hostProfile.fullName,
            profilePicture: hostProfile.profilePicture,
            roomId: hostProfile.roomId,
          );
        } else if (guestProfile.userId == otherId) {
          state = MessageProfileModel(
            userId: guestProfile.userId,
            fullName: guestProfile.fullName,
            profilePicture: guestProfile.profilePicture,
            roomId: guestProfile.roomId,
          );
        }
        return true;
      }
    }
    return false;
  }
}

final chatProvider =
    StateNotifierProvider<ChatViewModel, MessageProfileModel>(
        (ref) => ChatViewModel());
