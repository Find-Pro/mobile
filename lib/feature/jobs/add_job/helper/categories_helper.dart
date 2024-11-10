// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';
import 'package:findpro/feature/jobs/add_job/model/category_model.dart';
import 'package:findpro/feature/jobs/add_job/model/service_model.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/services.dart';

class CategoriesHelper {
  CategoriesHelper._init();
  static final CategoriesHelper _instance = CategoriesHelper._init();
  static CategoriesHelper get instance => _instance;

  Future<List<CategoryModel>> parseCategories() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.jsonServices);
      final categoriesList = json.decode(jsonString);
      if (categoriesList is! List) {
        throw Exception(
            'Invalid JSON format: Expected a list of categories.');
      }
      return categoriesList.map((json) {
        return CategoryModel.fromJson(json as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception('Error loading categories JSON: $e');
    }
  }

  // Get services by category id
  Future<List<ServiceModel>> getServicesByCategoryId(
      int categoryId) async {
    try {
      final categories = await parseCategories();
      return categories
          .firstWhere((category) => category.id == categoryId)
          .services;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CategoryModel>> sortCategoriesById() async {
    final categories = await parseCategories();
    categories.sort((a, b) => a.id.compareTo(b.id));
    return categories;
  }

  Future<CategoryModel?> findCategoryByName(String name) async {
    final categories = await parseCategories();
    return categories.firstWhere(
      (category) => category.name == name,
    );
  }
}
