import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {required this.isMyMessage,
      required this.time,
      required this.text,
      super.key});

  final bool isMyMessage;
  final String time;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: isMyMessage
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (isMyMessage)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                      ),
                      child: Text(
                        time,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMyMessage ? Colors.blue : Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(text,
                        maxLines: 3,
                        textAlign: isMyMessage
                            ? TextAlign.center
                            : TextAlign.start,
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: Colors.white)),
                  ),
                ),
                if (!isMyMessage)
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Text(
                        time,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
