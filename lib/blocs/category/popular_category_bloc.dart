import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/models/popular_category.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/repositories/category_repository.dart';

import 'popular_category_event.dart';
import 'popular_category_state.dart';

// BLoC

class PopularCategoryBloc
    extends Bloc<PopularCategoryEvent, PopularCategoryState> {
  final CategoryRepository categoryRepository;

  PopularCategoryBloc({
    required this.categoryRepository
  }) : super(PopularCategoryInitial()) {
    on<FetchPopularCategories>(_onFetchPopularCategories);
    on<PopularCategorySelected>(_onPopularCategorySelected);
  }

  void _onFetchPopularCategories(
      FetchPopularCategories event,
      Emitter<PopularCategoryState> emit
      ) async {
    try {
      emit(PopularCategoryLoading());
      print("fetch popular category - 1");
      final response = await categoryRepository.FetchPopularCategories();
      if (response.popularCategories.isEmpty) {
        emit(PopularCategoryError('No categories found'));
        return;
      }

      final popularCategoriesList = response.popularCategories;
      final firstCategory = popularCategoriesList.first.category;
      print("fetch popular category - 2");
      Category selectedCategory = firstCategory;
      List<Recipe> selectedCategoryRecipeList = popularCategoriesList.first.recipes;

      print("fetch popular category - 3");
      emit(
          PopularCategoryLoaded(
          response.popularCategories.map((pc) => pc.category).toList(),
          selectedCategory,
          selectedCategoryRecipeList
          )
      );
    } catch (e, st) {
      print("fetch popular category" + st.toString());
      emit(PopularCategoryError(e.toString()));
    }
  }

  void _onPopularCategorySelected(
      PopularCategorySelected event,
      Emitter<PopularCategoryState> emit
      ) async {

    try {
      final currentState = state as PopularCategoryLoaded;

      emit(PopularCategoryLoading());

      print("fetch popular category" + ":" + state.toString());

      final selectedCategoryRecipesList =
      await categoryRepository.FetchAllRecipesForSelectedCategory(
          event.selectedCategory.name);

      emit(PopularCategoryLoaded(
          currentState.popularCategories,
          event.selectedCategory,
          selectedCategoryRecipesList));
      // if(state is PopularCategoryLoaded) {
      //
      // }
    } catch (e) {
      print("fetch popular category");
      emit(PopularCategoryError(e.toString()));
    }
  }
}
