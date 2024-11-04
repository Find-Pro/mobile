import 'package:findpro/feature/message/view/chat_view.dart';
import 'package:findpro/feature/message/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';

/// Manage profile view business logic
base mixin ChatViewMixin on State<ChatView> {
  late final ChatViewModel _chatViewModel;

  ChatViewModel get homeViewModel => _chatViewModel;

  @override
  void initState() {
    super.initState();
  }
}
