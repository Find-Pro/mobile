import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/common/widget/you_should_login_app_widget.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/home/widget/select_country_app_bar.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/message/widget/messages_user_card.dart';
import 'package:findpro/feature/message/widget/messages_users_circle_avatar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
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
    if (!CacheManager.instance.getIsLoggedIn()) {
      return const YouShouldLoginAppWidget();
    }
    return Scaffold(
      appBar: SelectCountryAppBar(text: LocaleKeys.messages.tr()),
      body: messagesFuture.when(
        data: (_) {
          if (messagesViewModel.isEmpty) {
            return NoDataWidget(
              text: LocaleKeys.noMessagesFound.tr(),
            );
          }
          return Stack(
            children: [
              const HomeBackgroundImage(),
              ListView.builder(
                itemCount: messagesViewModel.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const SizedBox(
                      height: 150,
                      child: MessagesUsersCircleAvatar(),
                    );
                  }
                  final reverseIndex = messagesViewModel.length - index;
                  return MessagesUserCard(
                    messageProfileModel: messagesViewModel[reverseIndex],
                  );
                },
              ),
            ],
          );
        },
        error: (error, stackTrace) => NoDataWidget(
          text: LocaleKeys.noDataFound.tr(),
        ),
        loading: () => const CustomCircular(),
      ),
    );
  }
}
