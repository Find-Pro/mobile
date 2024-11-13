import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/message/widget/messages_user_card.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MessagesView extends ConsumerWidget {
  const MessagesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesViewModel = ref.watch(messagesProvider);
    final messagesFuture = ref.watch(messagesFutureProvider);
    return messagesFuture.when(
      data: (_) {
        if (messagesViewModel.isEmpty) {
          return const NoDataFoundWidget();
        }
        return Scaffold(
          appBar: const SettingsAppBar(text: LocaleKeys.messages),
          body: ListView.builder(
            itemCount: messagesViewModel.length,
            itemBuilder: (context, index) {
              final reverseIndex = messagesViewModel.length - 1 - index;
              return MessagesUserCard(
                messageProfileModel: messagesViewModel[reverseIndex],
              );
            },
          ),
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
