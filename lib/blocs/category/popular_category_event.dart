// Events
import 'package:equatable/equatable.dart';
import 'package:recipe_app/models/category.dart';

abstract class PopularCategoryEvent extends Equatable {
  const PopularCategoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchPopularCategories extends PopularCategoryEvent {}

class PopularCategorySelected extends PopularCategoryEvent {
  final Category selectedCategory;

  PopularCategorySelected(
      this.selectedCategory
      );

  @override
  List<Object?> get props => [selectedCategory];
}

