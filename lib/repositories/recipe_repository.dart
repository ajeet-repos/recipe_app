import 'dart:convert';

import 'package:recipe_app/models/ingredient.dart';
import 'package:http/http.dart' as http;

class RecipeRepository {
  final String baseUrl = 'your-base-url';  // Replace with your actual API base URL

  Future<void> createRecipe({
    required String name,
    required int servings,
    required int cookTime,
    String? videoUrl,
    required List<Ingredient> ingredients,
    // required List<String> instructions,
    List<String>? instructions
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/recipes'),  // Update with your actual endpoint
        headers: {
          'Content-Type': 'application/json',
          // Add any other headers like authentication tokens if needed
          // 'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'name': name,
          'servings': servings,
          'cookTime': cookTime,
          'videoUrl': videoUrl,
          'ingredients': ingredients.map((i) => i.toJson()).toList(),
          'instructions': instructions,
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException('Failed to create recipe: ${response.statusCode}');
      }

      // You can parse and return the created recipe if needed
      // final createdRecipe = Recipe.fromJson(json.decode(response.body));
      // return createdRecipe;

    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}

// Add this extension to handle ingredient serialization
extension IngredientToJson on Ingredient {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'imgUrl': imgUrl,
    };
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() => message;
}