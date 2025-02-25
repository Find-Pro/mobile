import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/response/string_job_model.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/message/view_model/chat_view_model.dart';
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
                        if (CacheManager.instance.getUserId() != 0) {
                          context.router.push(
                              UserProfileRoute(userId: jobModel.userId!));
                        }
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
              if (CacheManager.instance.getUserId() != 0)
                Expanded(
                    child: IconButton(
                        onPressed: () async {
                          final res = await ref
                              .read(chatProvider.notifier)
                              .getChatRoom(jobModel.userId!);
                          if (res) {
                            final chatWithUser = ref.watch(chatProvider);
                            await context.router.pushAndPopUntil(
                                ChatRoute(
                                    roomId: chatWithUser.roomId,
                                    chatWithUser: chatWithUser),
                                predicate: (_) => false);
                          } else {
                            WarningAlert().show(
                                context, LocaleKeys.anErrorOccurred, true);
                          }
                        },
                        icon: const Icon(Icons.message_outlined,
                            color: Colors.blue)))
            ],
          ),
        ),
      ),
    );
  }
}
