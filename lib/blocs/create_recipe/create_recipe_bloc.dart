import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/create_recipe/create_recipe_event.dart';
import 'package:recipe_app/blocs/create_recipe/create_recipe_state.dart';

class CreateRecipeBloc extends Bloc<CreateRecipeEvent, CreateRecipeState> {
  CreateRecipeBloc() : super(CreateRecipeInitial()) {
    on<SubmitRecipeEvent>(_onSubmitRecipe);
  }

  Future<void> _onSubmitRecipe(
      SubmitRecipeEvent event,
      Emitter<CreateRecipeState> emit,
      ) async {
    try {
      emit(CreateRecipeLoading());

      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      // Here you would make your actual API call
      // final response = await http.post(
      //   Uri.parse('your-api-endpoint'),
      //   body: {
      //     'name': event.name,
      //     'servings': event.servings,
      //     'cookTime': event.cookTime,
      //     'ingredients': event.ingredients,
      //   },
      // );

      // if (response.statusCode == 200) {
      //   emit(CreateRecipeSuccess());
      // } else {
      //   emit(CreateRecipeError('Failed to create recipe'));
      // }

      // For now, we'll just emit success
      emit(CreateRecipeSuccess());
    } catch (e) {
      emit(CreateRecipeError('Error creating recipe: ${e.toString()}'));
    }
  }
}