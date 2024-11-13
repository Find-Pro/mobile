import 'dart:convert';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/feature/message/model/message_model.dart';
import 'package:findpro/feature/message/model/send_message_model.dart';
import 'package:findpro/feature/message/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

mixin ChatViewMixin on State<ChatView> {
  late WebSocketChannel channel;
  final TextEditingController messageController = TextEditingController();
  List<MessageModel> messages = [];
  int currentUserId = 0;
  @override
  void initState() {
    super.initState();
    currentUserId = CacheManager.instance.getUserId();
    final url = '${ApiKey.webSocketUrl}${widget.roomId}';
    channel = WebSocketChannel.connect(Uri.parse(url));
    channel.stream.listen(
      (message) {
        final decodedMessage =
            jsonDecode(message as String) as Map<String, dynamic>;
        setState(() {
          if (decodedMessage['action'] == 'loadMessages') {
            final previousMessages = (decodedMessage['messages'] as List)
                .map((json) =>
                    MessageModel.fromJson(json as Map<String, dynamic>))
                .toList();
            messages.addAll(previousMessages);
          } else if (decodedMessage['action'] == 'receiveMessage') {
            final newMessage = MessageModel.fromJson(decodedMessage);
            messages.add(newMessage);
          }
        });
      },
    );
  }

  void sendMessage() {
    final userId = CacheManager.instance.getUserId();
    if (messageController.text.isNotEmpty) {
      final messageModel = SendMessageModel(
        roomId: widget.roomId,
        messageId: DateTime.now().millisecondsSinceEpoch,
        userId: userId,
        otherUserId: 12,
        message: messageController.text,
        timestamp: DateTime.now().toIso8601String(),
      );

      final newMessage = MessageModel(
        messageId: messageModel.messageId,
        userId: messageModel.userId,
        otherUserId: messageModel.otherUserId,
        message: messageModel.message,
        timestamp: messageModel.timestamp,
      );

      setState(() {
        messages.add(newMessage);
      });

      final messageJson = jsonEncode(messageModel.toJson());
      try {
        channel.sink.add(messageJson);
      } catch (e) {
        debugPrint('Error sending message: $e');
      }

      messageController.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
