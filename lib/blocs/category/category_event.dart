// Events

import '../../models/category.dart';

abstract class CategoryEvent {}

class CategorySelected extends CategoryEvent {
  final Category category;
  CategorySelected(this.category);
}