// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.g.dart';
part 'search_request.freezed.dart';

@freezed
class SearchRequest with _$SearchRequest {
  factory SearchRequest({
    @Default(0) int? jobCategoryId,
    @Default(0) int? jobServiceId,
    @Default(0) int? cityId,
    @Default(0) int? districtId,
    @Default('') String? country,
  }) = _SearchRequest;

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);
}
