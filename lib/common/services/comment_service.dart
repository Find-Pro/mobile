import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/services/interface/comment_operation.dart';
import 'package:findpro/common/services/manager/network_service.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/common/services/model/request/add_comment_request.dart';
import 'package:findpro/common/services/model/response/add_comment_response.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';

class CommentService implements CommentOperation {
  @override
  Future<AddCommentResponse?> addComment(
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
    return AddCommentResponse.fromJson(responseData!);
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
  Future<SuccessAndMessageResponse?> delete(int commentId) async {
    final responseData = await NetworkService.instance.baseRequest(
      APIRequestMethod.post,
      EndPointEnums.commentDelete,
      data: {'commentId': commentId},
    );

    return SuccessAndMessageResponse.fromJson(responseData!);
  }
}
