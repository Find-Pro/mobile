import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/manager/product_network_manager.dart';
import 'package:findpro/common/state/view_model/product_view_model.dart';
import 'package:get_it/get_it.dart';

/// Product container for dependency injection
class ProductContainer {
  const ProductContainer._();
  static final GetIt _getIt = GetIt.I;

  /// Product core required items
  static Future<void> setup() async {
    _getIt
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new)
      ..registerSingleton<ProductNetworkManager>(
        ProductNetworkManager.base(),
      )
      ..registerSingleton<CacheManager>(CacheManager.instance);
  }

  /// read your dependency item for [ProductContainer]
  static T read<T extends Object>() => _getIt<T>();
}
