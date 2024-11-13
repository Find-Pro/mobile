import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/jobs/view_model/create_chat_room_view_model.dart';
import 'package:findpro/feature/jobs/view_model/job_detail_view_model.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailUserTile extends ConsumerWidget {
  const JobDetailUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobViewModel = ref.watch(jobDetailProvider);
    return Card(
      elevation: 1,
      child: SizedBox(
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: Image.network(
                CreateImageUrl.instance
                    .photo(jobViewModel.result!.profilePicture!),
              ).image,
            ),
            Text(
              jobViewModel.result!.fullName ?? LocaleKeys.undefined,
              style: context.textTheme.titleLarge,
            ),
            IconButton(
                onPressed: () async {
                  final res = await ref
                      .read(createChatRoomProvider.notifier)
                      .create(jobViewModel.result!.userId!);
                  if (res.success) {
                    await ref
                        .read(messagesProvider.notifier)
                        .getChatRooms();
                    await context.router.push(const MessagesRoute());
                  } else {
                    WarningAlert().show(
                        context, res.message ?? LocaleKeys.error, false);
                  }
                },
                icon: Icon(
                  Icons.message_outlined,
                  color: context.themeData.cardColor,
                ))
          ],
        ),
      ),
    );
  }
}
