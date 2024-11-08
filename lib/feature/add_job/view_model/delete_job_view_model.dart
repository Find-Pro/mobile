import 'package:findpro/common/services/job_service.dart';
import 'package:findpro/common/services/model/response/success_and_message_response.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class DeleteJobViewModel extends StateNotifier<SuccessAndMessageResponse> {
  DeleteJobViewModel()
      : super(const SuccessAndMessageResponse(success: false));
  final loadingNotifier = ValueNotifier<bool>(false);

  Future<bool> deleteJob(int jobId) async {
    loadingNotifier.value = true;
    final res = await JobService().delete(jobId);
    if (res != null) {
      state = res;
      loadingNotifier.value = false;
      return res.success;
    }
    loadingNotifier.value = false;
    return false;
  }
}

final deleteJobProvider =
    StateNotifierProvider<DeleteJobViewModel, SuccessAndMessageResponse>(
        (ref) => DeleteJobViewModel());
