import 'package:findpro/common/services/model/response/string_job_model.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';

class JobListTileHelper {
  Future<StringJobModel> get(JobModel jobModel) async {
    final categoryAndServiceName = await JobDetailHelper.instance
        .getCategoryAndServiceName(
            jobModel.jobCategoryId!, jobModel.jobServiceId!);
    final cityAndDistrictName = await JobDetailHelper.instance
        .getCityAndDistrictName(
            jobModel.country!, jobModel.cityId!, jobModel.districtId!);
    return StringJobModel(
        category: categoryAndServiceName[0],
        service: categoryAndServiceName[1],
        country: jobModel.country,
        city: cityAndDistrictName[0],
        district: cityAndDistrictName[1]);
  }
}
