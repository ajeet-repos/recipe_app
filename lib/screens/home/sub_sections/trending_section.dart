import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/trending/trending_state.dart';
import 'package:recipe_app/widgets/trending_recipe_card.dart';
import 'package:recipe_app/blocs/trending/trending_bloc.dart';

class TrendingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        if (state is TrendingLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TrendingLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending now 🔥',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement see all functionality
                      },
                      child: Text('See all →'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    return TrendingRecipeCard(recipe: state.recipes[index]);
                  },
                ),
              ),
            ],
          );
        } else if (state is TrendingError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return Container();
      },
    );
  }
}