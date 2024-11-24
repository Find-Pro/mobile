import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/message_service.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:riverpod/riverpod.dart';

class MessagesViewModel extends StateNotifier<List<MessageProfileModel>> {
  MessagesViewModel() : super([]);

  Future<bool> getChatRooms() async {
    final currentUserId = CacheManager.instance.getUserId();
    final response = await MessageService.instance.chatRooms();

    if (response != null && response.success && response.rooms != null) {
      final followList = <MessageProfileModel>[];

      for (final room in response.rooms!) {
        final hostProfile = room?.hostProfile;
        final guestProfile = room?.guestProfile;

        if (hostProfile != null && hostProfile.userId != currentUserId) {
          followList.add(MessageProfileModel(
            userId: hostProfile.userId,
            fullName: hostProfile.fullName,
            profilePicture: hostProfile.profilePicture,
            roomId: hostProfile.roomId,
          ));
        }

        if (guestProfile != null && guestProfile.userId != currentUserId) {
          followList.add(MessageProfileModel(
            userId: guestProfile.userId,
            fullName: guestProfile.fullName,
            profilePicture: guestProfile.profilePicture,
            roomId: guestProfile.roomId,
          ));
        }
      }
      state = followList;
      return true;
    }

    return false;
  }
}

final messagesProvider =
    StateNotifierProvider<MessagesViewModel, List<MessageProfileModel>>(
        (ref) => MessagesViewModel());

final messagesFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success =
        await ref.read(messagesProvider.notifier).getChatRooms();
    return success;
  },
);
