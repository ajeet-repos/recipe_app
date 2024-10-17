import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/models/category.dart';

import 'category_event.dart';
import 'category_state.dart';

// BLoC

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(List<Category> categories) : super(CategoryState(categories.first)) {
    on<CategorySelected>((event, emit) {
      emit(CategoryState(event.category));
    });
  }
}