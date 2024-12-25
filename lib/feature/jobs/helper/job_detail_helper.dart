import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/services/model/response/string_job_model.dart';
import 'package:findpro/feature/jobs/add_job/helper/categories_helper.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/model/district_model.dart';
import 'package:findpro/feature/jobs/add_job/model/job_model.dart';
import 'package:flutter/services.dart';

//It converts a JobModel to StringJobModel

final class JobDetailHelper {
  JobDetailHelper._init();
  static final JobDetailHelper _instance = JobDetailHelper._init();
  static JobDetailHelper get instance => _instance;

  Future<StringJobModel> convert(JobModel jobModel) async {
    final cityAndDistrict = await getCityAndDistrictName(
      jobModel.country!,
      jobModel.cityId!,
      jobModel.districtId!,
    );
    final categoryAndService = await getCategoryAndServiceName(
      jobModel.jobCategoryId!,
      jobModel.jobServiceId!,
    );
    return StringJobModel(
      city: cityAndDistrict[0],
      district: cityAndDistrict[1],
      country: jobModel.country,
      createdAt: jobModel.createdAt,
      category: categoryAndService[0],
      service: categoryAndService[1],
      fullName: jobModel.fullName,
      profilePicture: jobModel.profilePicture,
      description: jobModel.description,
      hourlyWage: jobModel.hourlyWage,
      jobId: jobModel.jobId,
      userId: jobModel.userId,
      expiryDate: jobModel.expiryDate,
    );
  }

  Future<List<String>> getCategoryAndServiceName(
      int categoryId, int serviceId) async {
    final categoriesList =
        await CategoriesHelper.instance.parseCategories();
    final category =
        categoriesList.firstWhere((category) => category.id == categoryId);
    final service =
        category.services.firstWhere((service) => service.id == serviceId);

    return [
      category.name.tr(),
      service.name.tr(),
    ];
  }

  Future<List<String>> getCityAndDistrictName(
      String country, int cityId, int districtId) async {
    final cityJsonString =
        await rootBundle.loadString('assets/country/$country/city.json');

    final districtJsonString = await rootBundle
        .loadString('assets/country/$country/district.json');
    final cityJsonResponse = json.decode(cityJsonString);
    final cityList = cityJsonResponse as List;
    final cityModels = cityList
        .map((json) => CityModel.fromJson(json as Map<String, dynamic>))
        .toList();
    final city = cityModels.firstWhere((city) => city.ilId == cityId);
    final districtJsonResponse = json.decode(districtJsonString);
    final districtList = districtJsonResponse as List;
    final districtModels = districtList
        .map(
            (json) => DistrictModel.fromJson(json as Map<String, dynamic>))
        .toList();
    final district =
        districtModels.firstWhere((district) => district.id == districtId);
    return [
      city.name,
      district.name,
    ];
  }
}
