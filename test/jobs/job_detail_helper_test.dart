import 'package:findpro/feature/jobs/helper/job_detail_helper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_data/mock_job_models.dart';


void main() {
  late JobDetailHelper jobDetailHelper;

  setUp(() {
    jobDetailHelper = JobDetailHelper.instance;
  });

  test('convert should return a valid StringJobModel', () async {
    final jobModel = MockJobModels.de;
    final stringJobModel = await jobDetailHelper.convert(jobModel);

    expect(stringJobModel.jobId, jobModel.jobId);
    expect(stringJobModel.userId, jobModel.userId);
    expect(stringJobModel.country, jobModel.country);
    expect(stringJobModel.description, jobModel.description);
    expect(stringJobModel.hourlyWage, jobModel.hourlyWage);
    expect(stringJobModel.fullName, jobModel.fullName);
  });

  test('getCategoryAndServiceName should return correct names', () async {
    final categoryAndService = await jobDetailHelper.getCategoryAndServiceName(1, 101);
    expect(categoryAndService, isA<List<String>>());
    expect(categoryAndService.length, 2);
  });

  test('getCityAndDistrictName should return correct names', () async {
    final cityAndDistrict = await jobDetailHelper.getCityAndDistrictName('de', 3, 1);
    expect(cityAndDistrict, isA<List<String>>());
    expect(cityAndDistrict.length, 2);
  });
}
