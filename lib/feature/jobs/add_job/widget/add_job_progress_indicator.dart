import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddJobProgressIndicator extends ConsumerWidget
    implements PreferredSizeWidget {
  const AddJobProgressIndicator({required this.index, super.key});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addJobViewModel = ref.watch(addJobProvider.notifier);
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: () {
          addJobViewModel.clear();
          context.router.pop();
        },
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
      centerTitle: true,
      title: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: LinearProgressIndicator(
          value: (index + 1) / 5,
          backgroundColor: Colors.grey[300],
          color: Theme.of(context).cardColor,
        ),
      ),
      backgroundColor: context.themeData.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
