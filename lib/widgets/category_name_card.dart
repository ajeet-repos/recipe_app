import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/category/popular_category_event.dart';
import 'package:recipe_app/models/category.dart';

import '../blocs/category/popular_category_bloc.dart';
import '../blocs/category/popular_category_state.dart';

class CategoryNameCard extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryNameCard({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}