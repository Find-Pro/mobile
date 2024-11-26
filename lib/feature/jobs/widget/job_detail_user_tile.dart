import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/jobs/view_model/create_chat_room_view_model.dart';
import 'package:findpro/feature/jobs/view_model/job_detail_view_model.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailUserTile extends ConsumerWidget {
  const JobDetailUserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobViewModel = ref.watch(jobDetailProvider);
    return Padding(
      padding: PaddingInsets().medium,
      child: Card(
        elevation: 1,
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: PaddingInsets().medium,
                  child: GestureDetector(
                    onTap: () {
                      final currentUserId =
                          CacheManager.instance.getUserId();
                      if (currentUserId == jobViewModel.result!.userId!) {
                        context.router.pushAndPopUntil(
                            const ProfileRoute(),
                            predicate: (_) => false);
                      } else {
                        context.router.push(UserProfileRoute(
                            userId: jobViewModel.result!.userId!));
                      }
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: Image.network(
                        CreateImageUrl.instance
                            .photo(jobViewModel.result!.profilePicture!),
                      ).image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  jobViewModel.result!.fullName ??
                      LocaleKeys.undefined.tr(),
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
                          InformationToast().show(context,
                              LocaleKeys.chatRoomHasCreatedSuccess.tr());
                        } else {
                          await QuestionAlertDialog().show(context,
                              bodyText: LocaleKeys
                                  .chatRoomHasCreatedSuccess
                                  .tr(),
                              buttonText: LocaleKeys.okay.tr(),
                              onTap: () async => context.router
                                  .pushAndPopUntil(const MessagesRoute(),
                                      predicate: (_) => false));
                        }
                      },
                      icon: Icon(
                        Icons.message_outlined,
                        color: context.themeData.cardColor,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
