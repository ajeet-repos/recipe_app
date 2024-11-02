import 'dart:convert';

import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/recipe.dart';

class PopularCategory {
  Category category;
  List<Recipe> recipes;

  PopularCategory({
    required this.category,
    required this.recipes
  });

  factory PopularCategory.fromJson(Map<String, dynamic> json) =>
      PopularCategory(
          category: Category.fromMap(json['category']),
          recipes: List<Recipe>.from(
              json['recipes'].map((x) => Recipe.fromJson(x))
          )
      );

}