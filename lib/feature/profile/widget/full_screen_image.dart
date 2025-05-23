import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/custom_future_builder.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FullScreenImage {
  late NetworkImage imageProvider;

  void show(BuildContext context, String photoName) {
    imageProvider = NetworkImage(CreateImageUrl.instance.photo(photoName));
    showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CustomFutureBuilder<ImageInfo?>(
          future: _getCoverImageInfo(),
          child: (imageInfo) {
            final containerWidth = MediaQuery.of(context).size.width;
            double containerHeight;
            if (imageInfo != null) {
              final originalWidth = imageInfo.image.width.toDouble();
              final originalHeight = imageInfo.image.height.toDouble();
              containerHeight =
                  (containerWidth / originalWidth) * originalHeight;
            } else {
              containerHeight = containerWidth * 0.5;
            }

            return Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ListTile(
                      onTap: () => context.router.pop(),
                      tileColor: context.themeData.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        LocaleKeys.close.tr(),
                        textAlign: TextAlign.center,
                        style: context.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<ImageInfo?> _getCoverImageInfo() async {
    final imageStream = imageProvider.resolve(ImageConfiguration.empty);
    final completer = Completer<ImageInfo>();
    imageStream.addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          completer.complete(image);
        },
        onError: completer.completeError,
      ),
    );
    return completer.future;
  }
}
