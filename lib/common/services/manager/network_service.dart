import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:flutter/material.dart';

class NetworkService {
  NetworkService._() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiKey.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    );
  }

  static late final Dio _dio;

  static final instance = NetworkService._();

  Future<Map<String, dynamic>?> baseRequest(
    APIRequestMethod method,
    EndPointEnums endPoint, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.request<Map<String, dynamic>>(
          '${ApiKey.baseUrl}${endPoint.value}',
          data: data,
          options: Options(method: method.value));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        debugPrint('error'.tr() + response.data.toString());
        return null;
      }
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.message}');
      if (e.response != null) {
        debugPrint('Dio error response data: ${e.response?.data}');
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> photoRequest(
    APIRequestMethod method,
    EndPointEnums endPoint, {
    dynamic data,
  }) async {
    try {
      final response = await _dio.request<Map<String, dynamic>>(
        ApiKey.baseUrl + endPoint.value,
        data: data,
        options: Options(
          method: method.value,
          contentType: 'application/json',
        ),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        debugPrint('Error Network Service: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      debugPrint('Dio error: ${e.message}');
      debugPrint(e.toString());
      return null;
    }
  }
}
