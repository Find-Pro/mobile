import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'rating_stars.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    required this.commentModel,
    required this.onTap,
    super.key,
  });

  final CommentModel commentModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: CachedNetworkImageProvider(
                  CreateImageUrl.instance
                      .photo(commentModel.profilePhoto!),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${commentModel.rating}/5',
                        style: context.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RatingStars(rating: commentModel.rating!),
                    ],
                  ),
                  5.verticalSpace,
                  Text(
                    commentModel.fullName ?? LocaleKeys.undefined.tr(),
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    commentModel.commentText ?? '',
                    style: context.textTheme.labelMedium,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: context.themeData.indicatorColor,
                ),
                onPressed: onTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
