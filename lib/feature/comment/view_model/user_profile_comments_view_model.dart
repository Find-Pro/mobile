import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/comment_service.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';
import 'package:findpro/common/services/model/response/get_comments_response.dart';
import 'package:riverpod/riverpod.dart';

class UserProfileCommentsViewModel
    extends StateNotifier<GetCommentsResponse> {
  UserProfileCommentsViewModel() : super(GetCommentsResponse());

  int _currentUserId = 0;
  int get currentUserId => _currentUserId;

  Future<bool> getComments(int userId) async {
    _currentUserId = CacheManager.instance.getUserId();
    final response = await CommentService.instance.getComments(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }

  Future<bool> addComment(int userId, String text, int rating) async {
    final res = await CommentService.instance.addComment(AddCommentRequest(
        createdByUserId: currentUserId,
        userId: userId,
        commentText: text,
        rating: rating));
    if (res != null) {
      state = res;
      return res.success;
    }
    return false;
  }

  Future<bool> deleteMyComment(int commentId) async {
    final res = await CommentService.instance.delete(commentId);
    if (res != null) {
      state = res;
      return res.success;
    } else {
      return false;
    }
  }
}

final userProfileCommentsProvider = StateNotifierProvider<
    UserProfileCommentsViewModel,
    GetCommentsResponse>((ref) => UserProfileCommentsViewModel());

final userProfileCommentsFutureProvider =
    FutureProvider.autoDispose.family<bool, int>(
  (ref, userId) async {
    final success = await ref
        .read(userProfileCommentsProvider.notifier)
        .getComments(userId);
    return success;
  },
);
