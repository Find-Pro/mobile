import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeReadMoreImage extends StatelessWidget {
  const HomeReadMoreImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().xl,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  Assets.iconHr,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text:
                          "${LocaleKeys.seeHowYouCanFindAJob.tr().split(" ").take(4).join(" ")}\n"),
                  TextSpan(
                      text: LocaleKeys.seeHowYouCanFindAJob
                          .tr()
                          .split(' ')
                          .skip(4)
                          .join(' ')),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: TextButton(
              onPressed: () async {
                final uri = Uri.parse(
                  'https://duo-root-software.onrender.com',
                );
                await launchUrl(uri);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                maximumSize: const Size(120, 40),
                minimumSize: const Size(120, 40),
              ),
              child: Text(
                LocaleKeys.readMore.tr(),
                style: context.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
