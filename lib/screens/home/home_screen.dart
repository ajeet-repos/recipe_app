
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/category/popular_category_bloc.dart';
import 'package:recipe_app/blocs/category/popular_category_event.dart';
import 'package:recipe_app/blocs/trending/trending_bloc.dart';
import 'package:recipe_app/blocs/trending/trending_event.dart';
import 'package:recipe_app/repositories/category_repository.dart';
import 'package:recipe_app/repositories/trending_repository.dart';
import 'package:recipe_app/screens/home/sub_sections/popular_category_section.dart';
import 'package:recipe_app/screens/home/sub_sections/trending_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find best recipes for cooking'),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<TrendingBloc>(
            create: (context) => TrendingBloc(TrendingRepository())..add(LoadTrendingRecipes()),
          ),
          BlocProvider<PopularCategoryBloc>(
            create: (context) => PopularCategoryBloc(categoryRepository: CategoryRepository())..add(FetchPopularCategories()),
          ),
          // BlocProvider<RecentRecipeBloc>(
          //   create: (context) => RecentRecipeBloc(RecentRecipeRepository())..add(LoadRecentRecipes()),
          // ),
          // BlocProvider<CreatorBloc>(
          //   create: (context) => CreatorBloc(CreatorRepository())..add(LoadCreators()),
          // ),
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search recipes',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              TrendingSection(),
              PopularCategorySection(),
              // RecentRecipeSection(),
              // CreatorSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 32),
        height: 60,
        color: Colors.black,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: () {}, icon: Icon(
              Icons.home_filled,
              size: 28,
              color: Colors.white,
            )),
            IconButton(onPressed: () {}, icon: Icon(
              Icons.settings,
              size: 28,
              color: Colors.white,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        shape: CircleBorder(),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: () {
          // TODO: Implement create recipe functionality
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}