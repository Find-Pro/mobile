import 'package:dio/dio.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/const/enum/api_request_method_enum.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:logger/logger.dart';

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
          ApiKey.baseUrl + endPoint.value,
          data: data,
          options: Options(method: method.value));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        Logger().e(LocaleKeys.error + response.data.toString());
        return null;
      }
    } catch (e) {
      Logger().e(e.toString());
      return null;
    }
  }
}
