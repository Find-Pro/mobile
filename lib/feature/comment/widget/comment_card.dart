import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/services/model/comment_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: Image.network(
                  CreateImageUrl.instance
                      .photo(commentModel.profilePhoto!),
                ).image),
            Expanded(
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
                  10.verticalSpace,
                  Text(
                    commentModel.fullName ?? LocaleKeys.undefined,
                    style: context.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    commentModel.commentText!,
                    style: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: context.themeData.indicatorColor,
              ),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
