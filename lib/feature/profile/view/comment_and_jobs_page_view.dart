import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentAndJobsPageView extends ConsumerStatefulWidget {
  const CommentAndJobsPageView({
    required this.jobWidget,
    required this.commentWidget,
    super.key,
  });

  final Widget jobWidget;
  final Widget commentWidget;

  @override
  ConsumerState createState() => _CommentJobsPageViewState();
}

class _CommentJobsPageViewState
    extends ConsumerState<CommentAndJobsPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceSize.height(context),
      child: Scaffold(
        appBar: TabBar(
          dividerColor: Colors.transparent,
          unselectedLabelStyle: context.textTheme.labelMedium,
          labelStyle: context.textTheme.labelMedium,
          controller: _tabController,
          indicatorColor: Colors.blueAccent,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: context.themeData.indicatorColor,
          tabs: [
            Tab(
              icon: const Icon(Icons.business_center_outlined),
              text: 'jobs'.tr(),
            ),
            Tab(
              icon: const Icon(Icons.comment_outlined),
              text: 'comments'.tr(),
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            widget.jobWidget,
            widget.commentWidget,
          ],
        ),
      ),
    );
  }
}
