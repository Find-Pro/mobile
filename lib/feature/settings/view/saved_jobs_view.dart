import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/jobs/view_model/saved_jobs_view_model.dart';
import 'package:findpro/feature/jobs/widget/job_list_tile.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SavedJobsView extends ConsumerWidget {
  const SavedJobsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobsFuture = ref.watch(savedJobsFutureProvider);
    final savedJobsVm = ref.watch(savedJobsProvider);
    return Scaffold(
      appBar: SettingsAppBar(text: LocaleKeys.savedJobs.tr()),
      floatingActionButton: IconButton(
          onPressed: () {
            QuestionAlertDialog().show(context,
                bodyText: 'LocaleKeys.areYouSureDeleteAllSavedJobs.tr()',
                buttonText: LocaleKeys.yes,
                onTap: () =>
                    ref.read(savedJobsProvider.notifier).clearSavedJobs());
          },
          icon: Icon(
            Icons.delete_forever_outlined,
            size: 40,
            color: Colors.redAccent.shade700,
          )),
      body: savedJobsFuture.when(
        data: (_) {
          if (savedJobsVm.isEmpty) {
            return NoDataWidget(
              text: LocaleKeys.noDataFound.tr(),
            );
          }
          return ListView.builder(
            itemCount: savedJobsVm.length,
            itemBuilder: (context, index) {
              return JobListTile(jobModel: savedJobsVm[index]);
            },
          );
        },
        error: (error, stackTrace) => const NoDataWidget(
          text: '',
        ),
        loading: () => const CustomCircular(),
      ),
    );
  }
}
