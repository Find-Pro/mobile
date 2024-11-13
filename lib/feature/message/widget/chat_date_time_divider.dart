import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class ChatDateTimeDivider extends StatelessWidget {
  const ChatDateTimeDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('GetMsgDateTime().format(message.messageDate)',
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
