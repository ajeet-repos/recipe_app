import 'dart:convert';

import 'package:recipe_app/models/recipe.dart';

class TrendingRecipesResponse {
  int status;
  List<Recipe> trending;

  TrendingRecipesResponse({
    required this.status,
    required this.trending
  });

  factory TrendingRecipesResponse.fromJson(String str) =>
      TrendingRecipesResponse.fromMap(json.decode(str));

  factory TrendingRecipesResponse.fromMap(Map<String, dynamic> json) =>
      TrendingRecipesResponse(
          status: json['status'],
          trending: List<Recipe>.from(
              json['trending'].map((x) => Recipe.fromJson(x))
          )
      );
}