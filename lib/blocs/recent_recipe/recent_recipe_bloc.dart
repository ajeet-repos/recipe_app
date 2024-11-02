import 'dart:async';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_event.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_state.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/repositories/recent_recipe_repository.dart';

class RecentRecipeBloc extends Bloc<RecentRecipesEvent, RecentRecipesState> {
  final RecentRecipeRepository repository;

  RecentRecipeBloc({
    required this.repository
  }): super(RecentRecipeInitial()) {
    on<LoadRecentRecipes>(_onRecentRecipeLoaded);
  }



  FutureOr<void> _onRecentRecipeLoaded(
      LoadRecentRecipes event,
      Emitter<RecentRecipesState> emit
      ) async {

    try {
      emit(RecentRecipeLoading());

      final apiResponse = await repository.FetchRecentRecipes();

      emit(RecentRecipeLoaded(apiResponse.recentRecipes));
    } catch(e) {
      emit(RecentRecipeError(e.toString()));
    }

  }
}