import 'package:findpro/feature/user_profile/view/user_profile_view.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';

base mixin UserProfileViewMixin on State<UserProfileView> {
  late final UserProfileViewModel _userProfileViewModel;

  UserProfileViewModel get userProfileViewModel => _userProfileViewModel;

  @override
  void initState() {
    super.initState();
  }
}
