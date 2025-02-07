import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {

  const CustomFutureBuilder({
    required this.future, required this.child, super.key,
  });
  final Future<T> future;
  final Widget Function(T data) child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CustomCircular());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Text(
              '${LocaleKeys.error.tr()} : ${snapshot.error}',
              style: context.textTheme.headlineSmall,
            )
          );
        } else {
          return child(snapshot.data as T);
        }
      },
    );
  }
}
