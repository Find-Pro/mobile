import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const AuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: IconButton(
        onPressed: () async {
          if (context.mounted) {
            await context.router.pushAndPopUntil(const DemoOrFullVersion(),
                predicate: (_) => false);
          }
        },
        icon: Icon(
          context.platform == PlatformExtension.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey.shade700,
      elevation: 4,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
