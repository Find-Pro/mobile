import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/response/string_job_model.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/jobs/view_model/create_chat_room_view_model.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailUserTile extends ConsumerWidget {
  const JobDetailUserTile({
    required this.jobModel,
    super.key,
  });
  final StringJobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: PaddingInsets().medium,
      child: Card(
        elevation: 1,
        child: SizedBox(
          height: 130,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: PaddingInsets().medium,
                  child: GestureDetector(
                    onTap: () {
                      final currentUserId =
                          CacheManager.instance.getUserId();
                      if (currentUserId == jobModel.userId!) {
                        context.router.pushAndPopUntil(
                            const ProfileRoute(),
                            predicate: (_) => false);
                      } else {
                        context.router.push(
                            UserProfileRoute(userId: jobModel.userId!));
                      }
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: Image.network(
                        CreateImageUrl.instance
                            .photo(jobModel.profilePicture!),
                      ).image,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  jobModel.fullName ?? LocaleKeys.undefined.tr(),
                  style: context.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                  child: IconButton(
                      onPressed: () async {
                        final res = await ref
                            .read(createChatRoomProvider.notifier)
                            .create(jobModel.userId!);

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
                      icon: const Icon(Icons.message_outlined,
                          color: Colors.grey)))
            ],
          ),
        ),
      ),
    );
  }
}
