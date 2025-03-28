import 'package:findpro/common/services/model/comment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_comments_response.freezed.dart';
part 'get_comments_response.g.dart';

@freezed
class GetCommentsResponse with _$GetCommentsResponse {
  factory GetCommentsResponse({
    @Default(false) bool success,
    @Default('') String? message,
    @Default([]) List<CommentModel>? result,
  }) = _GetCommentsResponse;

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsResponseFromJson(json);
}
