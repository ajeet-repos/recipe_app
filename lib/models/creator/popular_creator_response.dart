import 'package:recipe_app/models/creator.dart';
import 'package:recipe_app/models/recipe.dart';

class PopularCreatorResponse {
  int status;
  List<Creator> popularCreators;

  PopularCreatorResponse({
    required this.status,
    required this.popularCreators
  });

  factory PopularCreatorResponse.fromMap(Map<String, dynamic> json) =>
      PopularCreatorResponse(
          status: json['status'],
          popularCreators: List<Creator>.from(
              json['popular_creators'].map((x) => Creator.fromMap(x))
          )
      );
}