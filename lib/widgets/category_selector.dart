import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/category/category_event.dart';
import 'package:recipe_app/models/category.dart';

import '../blocs/category/category_bloc.dart';
import '../blocs/category/category_state.dart';

class CategorySelector extends StatelessWidget {
  final List<Category> categories;

  const CategorySelector({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              bool isSelected = category == state.selectedCategory;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<CategoryBloc>().add(CategorySelected(category));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.grey[300] : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      category.name,
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.grey,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}