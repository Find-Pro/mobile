import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';
import 'package:findpro/common/services/model/response/add_comment_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

abstract class CommentOperation {
  Future<AddCommentResponse?> addComment(AddCommentRequest requestModel);
  Future<List<CommentModel>?> getComments(int userId);
  Future<SuccessAndMessageResponse?> delete(int commentId);
}
