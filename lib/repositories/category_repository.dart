import 'package:flutter/services.dart';
import 'package:recipe_app/models/popular_categories_response.dart';
import 'package:recipe_app/models/popular_category.dart';
import 'package:recipe_app/models/recipe.dart';

class CategoryRepository {

  Future<PopularCategoryResponse> FetchPopularCategories() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    final String apiResponse = await rootBundle.loadString('assets/popular_categories.json');

    return PopularCategoryResponse.fromJson(apiResponse);
  }

  Future<List<Recipe>> FetchAllRecipesForSelectedCategory(String categoryName) async {

    try {
      // Simulate network delay
      // await Future.delayed(const Duration(seconds: 1));
      final String apiResponse = await rootBundle.loadString('assets/popular_categories.json');
      final PopularCategoryResponse res = PopularCategoryResponse.fromJson(apiResponse);

      final category = res.popularCategories.firstWhere(
          (category) => category.category.name == categoryName,
        orElse: () => throw Exception('Category not found')
      );

      return category.recipes;

    } catch(e) {
      print(e.toString());
      return List<Recipe>.empty();
    }
  }
}