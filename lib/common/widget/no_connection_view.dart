import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NoConnectionView extends StatefulWidget {
  const NoConnectionView({super.key});

  @override
  NoConnectionViewState createState() => NoConnectionViewState();
}

class NoConnectionViewState extends State<NoConnectionView> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.themeData.scaffoldBackgroundColor,
      child: NoConnectionWidget(
        text: LocaleKeys.noConnection.tr(),
      ),
    );
  }
}
