import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.dart';
import 'package:findpro/common/services/manager/product_network_manager.dart';
import 'package:findpro/common/state/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

/// Product initialization manager class
@immutable
class ProductInitialization {
  const ProductInitialization._();

  static Future<void> mainInit() async {
    final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await CacheManager.instance.init();
    _getItInit();
    FlutterNativeSplash.remove();
  }

  static void _getItInit() {
    GetIt.I.registerSingleton<AppRouter>(AppRouter());
    GetIt.I
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new)
      ..registerSingleton<ProductNetworkManager>(
        ProductNetworkManager.base(),
      );
  }
}
