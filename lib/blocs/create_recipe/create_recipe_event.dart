abstract class CreateRecipeEvent {}

class SubmitRecipeEvent extends CreateRecipeEvent {
  final String name;
  final int servings;
  final int cookTime;
  final List<String> ingredients;

  SubmitRecipeEvent({
    required this.name,
    required this.servings,
    required this.cookTime,
    required this.ingredients,
  });
}