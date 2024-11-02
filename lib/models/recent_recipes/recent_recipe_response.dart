import 'package:recipe_app/models/recipe.dart';

class RecentRecipesResponse {
  int status;
  List<Recipe> recentRecipes;

  RecentRecipesResponse({
    required this.status,
    required this.recentRecipes
  });

  factory RecentRecipesResponse.fromMap(Map<String, dynamic> json) =>
      RecentRecipesResponse(
          status: json['status'],
          recentRecipes: List<Recipe>.from(
              json['recent_recipes'].map((x) => Recipe.fromJson(x))
          )
      );
}