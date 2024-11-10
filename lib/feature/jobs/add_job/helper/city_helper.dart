import 'dart:convert';
import 'package:findpro/feature/jobs/add_job/model/city_model.dart';
import 'package:findpro/feature/jobs/add_job/model/district_model.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/services.dart';

class CityHelper {
  CityHelper._init();
  static final CityHelper _instance = CityHelper._init();
  static CityHelper get instance => _instance;

  Future<List<CityModel>> parseCities() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.jsonCity);
      final jsonResponse = json.decode(jsonString);
      final cityList = jsonResponse as List;
      return cityList
          .map((json) => CityModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Error loading city JSON: $e');
    }
  }

  Future<List<DistrictModel>> parseDistricts() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.jsonDistrict);
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
