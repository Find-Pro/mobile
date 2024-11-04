import 'dart:io';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/services/interceptor/product_interceptor.dart';
import 'package:flutter/foundation.dart' show ValueChanged;
import 'package:vexana/vexana.dart';

typedef OnErrorStatus = ValueChanged<int>;

/// Product network manager
class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: ApiKey.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttpStatus]
  void listenErrorState({required OnErrorStatus onErrorStatus}) {
    interceptors.add(
      ProductInterceptor(onErrorStatus: onErrorStatus),
    );
  }
}
