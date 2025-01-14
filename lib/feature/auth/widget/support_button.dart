import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 120,
      child: GestureDetector(
        onTap: () => context.router.push(const SupportRoute()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.support_agent,
              color: Colors.black,
              size: 30,
            ),
            Text(
              LocaleKeys.support.tr(),
              style: context.textTheme.labelMedium
                  ?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
