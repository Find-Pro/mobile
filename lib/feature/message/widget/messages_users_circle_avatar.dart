import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagesUsersCircleAvatar extends ConsumerWidget {
  const MessagesUsersCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesViewModel = ref.watch(messagesProvider);
    final reversedMessages = messagesViewModel.reversed.toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          reversedMessages.length,
          (index) => Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: InkWell(
                    onTap: () {
                      context.router.push(ChatRoute(
                        roomId: reversedMessages[index].roomId,
                        chatWithUser: reversedMessages[index],
                      ));
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: Image.network(
                        CreateImageUrl.instance.photo(
                          reversedMessages[index].profilePicture,
                        ),
                      ).image,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    reversedMessages[index].fullName ?? '',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
