import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.dart';
import 'package:findpro/common/services/manager/product_network_manager.dart';
import 'package:findpro/common/state/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

/// Product initialization manager class
@immutable
class ProductInitialization {
  const ProductInitialization._();

  static Future<void> mainInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = [];
    await CacheManager.instance.init();
    _getItInit();
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
