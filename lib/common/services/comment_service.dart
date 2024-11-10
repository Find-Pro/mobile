import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/comment_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';
import 'package:findpro/common/services/model/response/get_comments_response.dart';

class CommentService implements CommentOperation {
  CommentService._();
  static final CommentService instance = CommentService._();
  @override
  Future<GetCommentsResponse?> addComment(
      AddCommentRequest requestModel) async {
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
    return GetCommentsResponse.fromJson(responseData!);
  }

  @override
  Future<GetCommentsResponse?> getComments(int userId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentGetComments,
      data: {'userId': userId},
    );

    return GetCommentsResponse.fromJson(responseData!);
  }

  @override
  Future<GetCommentsResponse?> delete(int commentId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentDelete,
      data: {'commentId': commentId},
    );

    return GetCommentsResponse.fromJson(responseData!);
  }
}
