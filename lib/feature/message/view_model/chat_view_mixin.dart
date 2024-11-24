import 'dart:convert';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/api_key.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:findpro/feature/message/model/message_model.dart';
import 'package:findpro/feature/message/model/send_message_model.dart';
import 'package:findpro/feature/message/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

mixin ChatViewMixin on ConsumerState<ChatView> {
  late WebSocketChannel channel;
  final messageController = TextEditingController();
  final scrollCnt = ScrollController();
  List<MessageModel> messages = [];
  int currentUserId = 0;

  @override
  void initState() {
    super.initState();
    scrollCnt.addListener(scrollListener);
    currentUserId = CacheManager.instance.getUserId();
    final url = '${ApiKey.webSocketUrl}${widget.roomId}';
    channel = WebSocketChannel.connect(Uri.parse(url));
    channel.stream.listen(
      (message) {
        final decodedMessage =
            jsonDecode(message as String) as Map<String, dynamic>;
        final action = decodedMessage['action'];

        if (action == 'loadMessages') {
          _handleLoadMessages(decodedMessage);
        } else if (action == 'receiveMessage') {
          _handleReceiveMessage(decodedMessage);
        }
      },
      onDone: () => debugPrint('WebSocket bağlantısı kapandı.'),
    );
  }

  void _handleLoadMessages(Map<String, dynamic> decodedMessage) {
    final previousMessages = (decodedMessage['messages'] as List)
        .map((json) => MessageModel.fromJson(json as Map<String, dynamic>))
        .toList();
    setState(() {
      messages.addAll(previousMessages);
    });
  }

  void _handleReceiveMessage(Map<String, dynamic> decodedMessage) {
    final newMessage = MessageModel.fromJson(
        decodedMessage['message'] as Map<String, dynamic>);
    if (!messages.any((msg) => msg.messageId == newMessage.messageId)) {
      setState(() {
        messages.add(newMessage);
      });
    }
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      final messageModel = SendMessageModel(
        roomId: widget.roomId,
        messageId: DateTime.now().millisecondsSinceEpoch,
        userId: currentUserId,
        otherUserId: widget.chatWithUser.userId,
        message: messageController.text,
        timestamp: DateTime.now().toIso8601String(),
      );
      final messageJson = jsonEncode({
        'action': 'sendMessage',
        ...messageModel.toJson(),
      });
      try {
        channel.sink.add(messageJson);
        ref.read(notificationProvider).sendNotification(
              isMessage: true,
              message: messageModel.message,
              receiverId: widget.chatWithUser.userId.toString(),
              senderId: currentUserId.toString(),
            );
        setState(() {});
      } catch (e) {
        debugPrint('Mesaj gönderme hatası: $e');
      }
      messageController.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void scrollListener() {
    if (scrollCnt.position.pixels == scrollCnt.position.minScrollExtent) {
      setState(() {});
    }
  }
}
