import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_event.dart';
import 'package:recipe_app/models/recent_recipes/recent_recipe_response.dart';

class RecentRecipeRepository {

  Future<RecentRecipesResponse> FetchRecentRecipes() async {

    final String apiResponse = await rootBundle.loadString('assets/recent_recipes.json');

    return RecentRecipesResponse.fromMap(json.decode(apiResponse));
  }
}