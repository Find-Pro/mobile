import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';

abstract class CommentOperation {
  Future<CommentModel?> addComment(AddCommentRequest requestModel);
  Future<List<CommentModel>?> getComments(int userId);
  Future<CommentModel?> delete(int commentId);
}
