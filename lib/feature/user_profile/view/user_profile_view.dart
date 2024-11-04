import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_mixin.dart';
import 'package:flutter/material.dart';

part '../widget/profile_app_bar.dart';

@RoutePage()
class UserProfileView extends StatefulWidget {
  const UserProfileView({required this.userId, super.key});
  final int userId;
  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

final class _UserProfileViewState extends State<UserProfileView>
    with UserProfileViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ProfileAppBar(),
      body: TextButton(
          onPressed: () {
//context.router.pushAndPopUntil(ProfileRoute(), predicate: (_) => false);
// context.router.pushWidget(UserProfileView());
// context.navigateTo(CameraRoute());
          },
          child: const Text('lsadkşasd')),
    );
  }
}
