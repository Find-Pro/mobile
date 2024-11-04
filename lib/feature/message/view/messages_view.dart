import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/message/view_model/messages_view_mixin.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MessagesView extends StatefulWidget {
  const MessagesView({
    super.key,
  });

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

final class _MessagesViewState extends State<MessagesView>
    with MessagesViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('MESSAGES')),
        ],
      ),
    );
  }
}
