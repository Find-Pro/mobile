import 'package:findpro/common/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RouterProvider {
  RouterProvider(this.ref) {
    appRouter = AppRouter();
  }
  late AppRouter appRouter;
  Ref ref;
}

final routerProvider = Provider<AppRouter>((ref) {
  return RouterProvider(ref).appRouter;
});
