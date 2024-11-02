import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/category/popular_category_bloc.dart';
import 'package:recipe_app/blocs/category/popular_category_event.dart';
import 'package:recipe_app/blocs/category/popular_category_state.dart';
import 'package:recipe_app/widgets/category_name_card.dart';
import 'package:recipe_app/widgets/category_recipe_card.dart';

class PopularCategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCategoryBloc, PopularCategoryState>(
      builder: (context, state) {
        if (state is PopularCategoryInitial) {
          context.read<PopularCategoryBloc>().add(FetchPopularCategories());
          return CircularProgressIndicator();
        } else if (state is PopularCategoryLoading) {
          return CircularProgressIndicator();
        } else if (state is PopularCategoryLoaded) {
          print("create ui for popular category");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular category',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle see all action
                      },
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.pink,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: state.popularCategories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CategoryNameCard(
                        name: category.name,
                        isSelected: category.name == state.selectedCategory.name,
                        onTap: () {
                          context.read<PopularCategoryBloc>().add(PopularCategorySelected(category));
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.selectedCategoryRecipes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: SizedBox(
                        width: 200,
                        child: CategoryRecipeCard(
                          recipe: state.selectedCategoryRecipes[index],
                          onFavoritePressed: () {
                            // Handle favorite toggle
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is PopularCategoryError) {
          return Text('Error: ${state.message}');
        }
        return Container();
      },
    );

  }
}