import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_bloc.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_event.dart';
import 'package:recipe_app/blocs/recent_recipe/recent_recipe_state.dart';
import 'package:recipe_app/widgets/recent_recipe_card.dart';

class RecentRecipeSection extends StatelessWidget {
  const RecentRecipeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Recipes',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle see all navigation
                },
                child: const Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<RecentRecipeBloc, RecentRecipesState>(
          builder: (context, state) {
            if (state is RecentRecipeInitial) {
              context.read<RecentRecipeBloc>().add(LoadRecentRecipes());
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RecentRecipeLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RecentRecipeError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is RecentRecipeLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.recentRecipeList.map((recipe) {
                      return RecentRecipeCard(recipe: recipe);
                    }).toList(),
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}