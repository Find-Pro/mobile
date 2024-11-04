import 'package:findpro/common/services/model/comment_model.dart';

abstract class CommentOperation {
  Future<CommentModel?> addComment(
    int createdByUserId,
    int userId,
    String commentText,
    int? rating,
  );
  Future<List<CommentModel>?> getComments(int userId);
  Future<CommentModel?> delete(int commentId);
}
