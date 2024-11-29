import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/message_date_parsing.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:findpro/feature/message/view_model/chat_view_mixin.dart';
import 'package:findpro/feature/message/widget/chat_app_bar.dart';
import 'package:findpro/feature/message/widget/message_card.dart';
import 'package:findpro/feature/message/widget/send_message_field.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ChatView extends ConsumerStatefulWidget {
  const ChatView({
    required this.roomId,
    required this.chatWithUser,
    super.key,
  });
  final String roomId;
  final MessageProfileModel chatWithUser;
  @override
  ConsumerState<ChatView> createState() => ChatViewState();
}

class ChatViewState extends ConsumerState<ChatView> with ChatViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                controller: scrollCnt,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageCard(
                      isMyMessage: currentUserId == message.userId,
                      time: message.timestamp?.formatMessageDate ??
                          LocaleKeys.error.tr(),
                      text: message.message);
                },
              ),
            ),
            SendMessageField(
                controller: messageController, onTap: sendMessage),
          ],
        ),
      ),
      appBar: ChatAppBar(
          onTap: () => context.router
              .push(UserProfileRoute(userId: widget.chatWithUser.userId)),
          fullName:
              widget.chatWithUser.fullName ?? LocaleKeys.undefined.tr(),
          photo: widget.chatWithUser.profilePicture),
    );
  }
}
