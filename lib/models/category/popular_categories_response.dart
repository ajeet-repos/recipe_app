import 'dart:convert';

import 'package:recipe_app/models/category/popular_category.dart';

class PopularCategoryResponse {
  int status;
  List<PopularCategory> popularCategories;

  PopularCategoryResponse({
    required this.status,
    required this.popularCategories
  });

  factory PopularCategoryResponse.fromJson(String str) =>
    PopularCategoryResponse.fromMap(json.decode(str));

  factory PopularCategoryResponse.fromMap(Map<String, dynamic> json) =>
    PopularCategoryResponse(
        status: json['status'],
        popularCategories: List<PopularCategory>.from(
          json['popular_categories'].map((x) => PopularCategory.fromJson(x))
        )
    );
}
