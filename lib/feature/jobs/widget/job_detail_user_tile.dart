import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/information_toast.dart';
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
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context.router.push(UserProfileRoute(
                    userId: jobViewModel.result!.userId!)),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: Image.network(
                    CreateImageUrl.instance
                        .photo(jobViewModel.result!.profilePicture!),
                  ).image,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                jobViewModel.result!.fullName ?? 'undefined'.tr(),
                style: context.textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: IconButton(
                    onPressed: () async {
                      final res = await ref
                          .read(createChatRoomProvider.notifier)
                          .create(jobViewModel.result!.userId!);
                      if (res.success) {
                        await ref
                            .read(messagesProvider.notifier)
                            .getChatRooms();
                        InformationToast()
                            .show(context, 'chatRoomCreated'.tr());
                      } else {
                        WarningAlert().show(
                            context, res.message ?? 'error'.tr(), false);
                      }
                    },
                    icon: Icon(
                      Icons.message_outlined,
                      color: context.themeData.cardColor,
                    )))
          ],
        ),
      ),
    );
  }
}
