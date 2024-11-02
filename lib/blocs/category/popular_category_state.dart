// States

import 'package:equatable/equatable.dart';
import 'package:recipe_app/models/category/popular_category.dart';
import 'package:recipe_app/models/recipe.dart';

import '../../models/category.dart';

abstract class PopularCategoryState extends Equatable {
  const PopularCategoryState();

  @override
  List<Object?> get props => [];
}

class PopularCategoryInitial extends PopularCategoryState {}

class PopularCategoryLoading extends PopularCategoryState {}

class PopularCategoryLoaded extends PopularCategoryState {
  final List<Category> popularCategories; // to show the list of categories in the ui
  final Category selectedCategory;
  final List<Recipe> selectedCategoryRecipes; // all recipes of selected categories

  PopularCategoryLoaded(
      this.popularCategories,
      this.selectedCategory,
      this.selectedCategoryRecipes
      );

  @override
  List<Object?> get props => [
    popularCategories,
    selectedCategory,
    selectedCategoryRecipes
  ];
}

class PopularCategoryError extends PopularCategoryState {
  final String message;

  PopularCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}