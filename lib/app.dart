import 'package:flutter/material.dart';
import 'package:recipe_app/screens/create_recipe/create_recipe_screen.dart';
import 'package:recipe_app/screens/home/home_screen.dart';
// import 'package:recipe_app/screens/home/home_screen_old.dart';
import 'package:recipe_app/screens/onboarding/onboarding_screen.dart';
import 'package:recipe_app/screens/recipe_details/recipe_details_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        // '/home': (context) => HomeScreen(),
        '/recipe_details': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return RecipeDetailsScreen(recipe: args['recipe']);
        },
        '/create_recipe': (context) => CreateRecipeScreen(),
      },
    );;
  }
}