import 'dart:math';
import 'package:flutter/services.dart';
import 'package:recipe_app/models/trending/trending_recipes_response.dart';

class TrendingRepository {

  Future<TrendingRecipesResponse> getTrendingRecipes() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));
    final String response = await rootBundle.loadString('assets/trending_recipes.json');

    return TrendingRecipesResponse.fromJson(response);
  }

}