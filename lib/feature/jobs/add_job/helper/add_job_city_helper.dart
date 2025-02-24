import 'dart:convert';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/model/district_model.dart';
import 'package:flutter/services.dart';

final class AddJobCityHelper {
  AddJobCityHelper._init() {
    getCurrentCountry();
  }
  static final AddJobCityHelper _instance = AddJobCityHelper._init();
  static AddJobCityHelper get instance => _instance;
  String? country;

  Future<void> getCurrentCountry() async {
    country = CacheManager.instance.getCountry();
  }

  Future<List<CityModel>> parseCities() async {
    final jsonString =
        await rootBundle.loadString('assets/country/$country/city.json');
    final jsonResponse = json.decode(jsonString);
    final cityList = jsonResponse as List;
    return cityList
        .map((json) => CityModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<DistrictModel>> parseDistricts() async {
    try {
      final jsonString = await rootBundle
          .loadString('assets/country/$country/district.json');
      final jsonResponse = json.decode(jsonString);
      final districtList = jsonResponse as List;
      return districtList
          .map((json) =>
              DistrictModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error loading district JSON: $e');
    }
  }

  Future<List<DistrictModel>> getDistrictsByCityId(int cityId) async {
    try {
      final districts = await parseDistricts();
      return districts
          .where((district) => district.ilId == cityId)
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<CityModel>> getAllCities() async {
    return parseCities();
  }
}
