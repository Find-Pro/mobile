import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/comment_operation.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:vexana/vexana.dart';

class CommentService implements CommentOperation {
  CommentService(INetworkManager<CommentModel> networkManager)
      : _networkManager = networkManager;
  final INetworkManager<CommentModel> _networkManager;

  @override
  Future<CommentModel?> addComment(
    int createdByUserId,
    int userId,
    String commentText,
    int? rating,
  ) async {
    final response =
        await _networkManager.send<CommentModel, CommentModel>(
      EndPointEnums.commentAdd.fullUrl,
      parseModel: CommentModel(),
      method: RequestType.POST,
      data: CommentModel(
        createdByUserId: createdByUserId,
        userId: userId,
        commentText: commentText,
        rating: rating,
      ), // Pass the model directly as data
    );

    return response.data;
  }

  @override
  Future<List<CommentModel>?> getComments(int userId) async {
    final response =
        await _networkManager.send<CommentModel, List<CommentModel>>(
      EndPointEnums.commentGetComments.fullUrl,
      parseModel: CommentModel(),
      method: RequestType.POST,
    );

    return response.data;
  }

  @override
  Future<CommentModel?> delete(int commentId) async {
    final response =
        await _networkManager.send<CommentModel, CommentModel>(
      EndPointEnums.commentDelete.fullUrl,
      parseModel: CommentModel(),
      method: RequestType.POST,
      data: {'commentId': commentId},
    );

    return response.data;
  }
}
