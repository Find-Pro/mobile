import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/comment_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';

class CommentService implements CommentOperation {
  @override
  Future<CommentModel?> addComment(AddCommentRequest requestModel) async {
    final createdByUserId = CacheManager.instance.getUserId();
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentAdd,
      data: {
        'createdByUserId': createdByUserId,
        'userId': requestModel.userId,
        'commentText': requestModel.commentText,
        'rating': requestModel.rating,
      },
    );
    return CommentModel.fromJson(responseData!);
  }

  @override
  Future<List<CommentModel>?> getComments(int userId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentGetComments,
      data: {'userId': userId},
    );

    return (responseData!['comments'] as List<dynamic>)
        .map((json) => CommentModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<CommentModel?> delete(int commentId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentDelete,
      data: {'commentId': commentId},
    );

    return CommentModel.fromJson(responseData!);
  }
}
