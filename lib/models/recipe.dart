// class Recipe {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final String author;
//   final double rating;
//   final int cookTime;
//   final List<String> ingredients;
//   final List<String> instructions;
//
//   Recipe({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.author,
//     required this.rating,
//     required this.cookTime,
//     required this.ingredients,
//     required this.instructions,
//   });
//
//   factory Recipe.fromJson(Map<String, dynamic> json) {
//     return Recipe(
//       id: json['id'],
//       name: json['name'],
//       imageUrl: json['imageUrl'],
//       author: json['author'],
//       rating: json['rating'].toDouble(),
//       cookTime: json['cookTime'],
//       ingredients: List<String>.from(json['ingredients']),
//       instructions: List<String>.from(json['instructions'])
//     );
//   }
// }

import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/review.dart';
import 'package:recipe_app/models/video.dart';

import 'creator.dart';
import 'ingredient.dart';

class Recipe {
  final int id;
  final String name;
  final String imageUrl;
  final Video video;
  final int servings;
  final int cookTime;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final double rating;
  final int reviewCount;
  final Creator creator;
  final Category category;
  final List<Review> reviews;
  final DateTime createdAt;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.video,
    required this.servings,
    required this.cookTime,
    required this.ingredients,
    required this.instructions,
    required this.rating,
    required this.reviewCount,
    required this.creator,
    required this.category,
    required this.reviews,
    required this.createdAt,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {

    return Recipe(
      id: json["id"],
      name: json["name"],
      creator: Creator.fromMap(json["creator"]),
      rating: json["rating"],
      reviewCount: json["review_count"],
      imageUrl: "https://images.pexels.com/photos/3807044/pexels-photo-3807044.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",//json["img_url"],
      video: Video.fromMap(json["video"]),
      servings: json["serving"],
      cookTime: json["cooking_time"],
      category: Category.fromMap(json['category']),
      reviews: List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
      createdAt: _parseDateTime(json["created_at"]),
      ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromMap(x))),
      instructions: List<String>.from(json["instructions"].map((x) => x)),
    );
  }

  static DateTime _parseDateTime(String dateString) {
    try {
      // Split the date string into year, month, and day
      List<String> parts = dateString.split('/');
      if (parts.length == 3) {
        int year = int.parse(parts[0]);
        int month = int.parse(parts[1]);
        int day = int.parse(parts[2]);
        return DateTime(year, month, day);
      }
      // If the format is not as expected, try parsing as ISO 8601
      return DateTime.parse(dateString);
    } catch (e) {
      // If all parsing attempts fail, return the current date and time
      print("Error parsing date: $dateString. Using current date and time.");
      return DateTime.now();
    }
  }
}