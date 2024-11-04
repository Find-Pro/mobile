import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/message/view_model/chat_view_mixin.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

final class _ChatViewState extends State<ChatView> with ChatViewMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.themeData.scaffoldBackgroundColor,
      ),
    );
  }
}
