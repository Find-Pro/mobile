import 'package:findpro/common/services/model/request/add_comment_request.dart';
import 'package:findpro/common/services/model/response/get_comments_response.dart';

abstract class CommentOperation {
  Future<GetCommentsResponse?> addComment(AddCommentRequest requestModel);
  Future<GetCommentsResponse?> getComments(int userId);
  Future<GetCommentsResponse?> delete(int commentId);
}
