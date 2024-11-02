import 'package:equatable/equatable.dart';
import 'package:recipe_app/models/recipe.dart';

class RecentRecipesEvent extends Equatable {
  const RecentRecipesEvent();

  @override
  List<Object?> get props => [];
}

class LoadRecentRecipes extends RecentRecipesEvent {}
class RecentRecipeSelected extends RecentRecipesEvent {}

