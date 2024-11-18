import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/feature/search/view_model/user_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchBar extends ConsumerWidget {
  const UserSearchBar({
    required this.textCnt,
    super.key,
  });

  final TextEditingController textCnt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: PaddingInsets().large,
      child: Container(
        decoration: BoxDecoration(
          color: context.themeData.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(22.5),
          border: Border.all(
            color: context.themeData.primaryColorDark,
            width: 1.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          style: context.textTheme.labelLarge,
          controller: textCnt,
          onChanged: (query) {
            if (query.length >= 3) {
              ref.read(userSearchProvider.notifier).search(query);
            }
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              suffixStyle: context.textTheme.labelLarge,
              border: InputBorder.none,
              suffixIcon: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.red,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    textCnt.clear();
                    ref.read(userSearchProvider).result!.clear();
                  })),
        ),
      ),
    );
  }
}
