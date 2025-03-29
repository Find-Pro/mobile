import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesUserCard extends ConsumerWidget {
  const MessagesUserCard({required this.messageProfileModel, super.key});

  final MessageProfileModel messageProfileModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Card(
        elevation: 0.3,
        child: Padding(
          padding: PaddingInsets().medium,
          child: ListTile(
            onTap: () {
              context.router.push(ChatRoute(
                  roomId: messageProfileModel.roomId,
                  chatWithUser: messageProfileModel));
            },
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: CachedNetworkImageProvider(
                CreateImageUrl.instance
                    .photo(messageProfileModel.profilePicture),
              ),
            ),
            trailing: IconButton(
                onPressed: () => QuestionAlertDialog().show(context,
                        onTap: () async {
                      final success = await ref
                          .read(messagesProvider.notifier)
                          .deleteRoom(messageProfileModel.roomId);
                      if (success) {
                        await context.router.pop().then((value) {
                          InformationToast()
                              .show(context, LocaleKeys.success);
                        });
                      } else {
                        await context.router.pop().then((value) {
                          InformationToast()
                              .show(context, LocaleKeys.success);
                        });
                      }
                    },
                        bodyText: LocaleKeys.youSureDeleteChat.tr(),
                        buttonText: LocaleKeys.delete.tr()),
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                )),
            title: Text(
              messageProfileModel.fullName!,
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
