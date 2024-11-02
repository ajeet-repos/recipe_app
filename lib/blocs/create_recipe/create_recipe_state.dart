abstract class CreateRecipeState {}

class CreateRecipeInitial extends CreateRecipeState {}

class CreateRecipeLoading extends CreateRecipeState {}

class CreateRecipeSuccess extends CreateRecipeState {}

class CreateRecipeError extends CreateRecipeState {
  final String message;
  CreateRecipeError(this.message);
}