import 'package:findpro/feature/message/view/messages_view.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:flutter/material.dart';

base mixin MessagesViewMixin on State<MessagesView> {
  late final MessagesViewModel _messagesViewModel;

  MessagesViewModel get messagesViewModel => _messagesViewModel;

  @override
  void initState() {
    super.initState();
  }
}
