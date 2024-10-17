import 'package:recipe_app/models/recipe.dart';

abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class TrendingLoading extends TrendingState {}

class TrendingLoaded extends TrendingState {
  final List<Recipe> recipes;

  TrendingLoaded(this.recipes);
}

class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message);
}