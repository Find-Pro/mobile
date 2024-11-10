import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/comment_service.dart';
import 'package:findpro/common/services/model/response/get_comments_response.dart';
import 'package:riverpod/riverpod.dart';

class MyCommentsViewModel extends StateNotifier<GetCommentsResponse> {
  MyCommentsViewModel() : super(GetCommentsResponse());

  Future<bool> getComments() async {
    final userId = CacheManager.instance.getUserId();
    final response = await CommentService.instance.getComments(userId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }

  Future<bool> deleteComment(int commentId) async {
    final response = await CommentService.instance.delete(commentId);
    if (response != null) {
      state = response;
      return response.success;
    }
    return false;
  }
}

final myCommentsProvider =
    StateNotifierProvider<MyCommentsViewModel, GetCommentsResponse>(
        (ref) => MyCommentsViewModel());

final myCommentsFutureProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    final success =
        await ref.read(myCommentsProvider.notifier).getComments();
    return success;
  },
);
