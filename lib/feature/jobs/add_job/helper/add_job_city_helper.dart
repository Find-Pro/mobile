import 'dart:convert';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/services/routes/user_service.dart';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/model/district_model.dart';
import 'package:flutter/services.dart';

class AddJobCityHelper {
  AddJobCityHelper._init() {
    getCurrentCountry();
  }
  static final AddJobCityHelper _instance = AddJobCityHelper._init();
  static AddJobCityHelper get instance => _instance;
  String? country;

  Future<void> getCurrentCountry() async {
    final userId = CacheManager.instance.getUserId();
    final res = await UserService.instance.profile(userId);
    country = res!.user!.userId.toString();
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

  Future<CityModel?> findCityByName(String name) async {
    final cities = await parseCities();
    return cities.firstWhere((city) => city.name == name);
  }
}
