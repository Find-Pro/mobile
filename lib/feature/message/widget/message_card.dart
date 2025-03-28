import 'package:cached_network_image/cached_network_image.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageCard extends ConsumerWidget {
  const MessageCard(
      {required this.isMyMessage,
      required this.time,
      required this.profilePhoto,
      required this.text,
      super.key});

  final bool isMyMessage;
  final String profilePhoto;
  final String time;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(profileProvider);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          mainAxisAlignment: isMyMessage
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            if (!isMyMessage)
              _AvatarAndText(photo: profilePhoto, time: time),
            Flexible(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isMyMessage ? Colors.blue : Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(text,
                    maxLines: 3,
                    textAlign:
                        isMyMessage ? TextAlign.start : TextAlign.center,
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: Colors.white)),
              ),
            ),
            if (isMyMessage)
              _AvatarAndText(
                  photo: currentUser.user!.profilePicture!, time: time),
          ],
        ),
      ),
    );
  }
}

class _AvatarAndText extends StatelessWidget {
  const _AvatarAndText({
    required this.photo,
    required this.time,
  });

  final String photo;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
              CreateImageUrl.instance.photo(photo),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              time,
              style: context.textTheme.labelSmall?.copyWith(
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
