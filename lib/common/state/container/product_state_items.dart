import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/manager/product_network_manager.dart';
import 'package:findpro/common/state/container/product_container.dart';
import 'package:findpro/common/state/view_model/product_view_model.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class ProductStateItems {
  const ProductStateItems._();
  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();
  static CacheManager get productCacheManager =>
      ProductContainer.read<CacheManager>();
}
