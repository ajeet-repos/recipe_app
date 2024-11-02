import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/create_recipe/create_recipe_bloc.dart';
import 'package:recipe_app/blocs/create_recipe/create_recipe_event.dart';
import 'package:recipe_app/blocs/create_recipe/create_recipe_state.dart';

class CreateRecipeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _servingsController = TextEditingController();
  final _cookTimeController = TextEditingController();
  final _ingredientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateRecipeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Recipe'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<CreateRecipeBloc, CreateRecipeState>(
          listener: (context, state) {
            if (state is CreateRecipeSuccess) {
              // On success, navigate back
              Navigator.pop(context);
            } else if (state is CreateRecipeError) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Recipe Name
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Recipe Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter recipe name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Servings
                  TextFormField(
                    controller: _servingsController,
                    decoration: InputDecoration(
                      labelText: 'Number of Servings',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter number of servings';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Cook Time
                  TextFormField(
                    controller: _cookTimeController,
                    decoration: InputDecoration(
                      labelText: 'Cooking Time (minutes)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter cooking time';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Ingredients
                  TextFormField(
                    controller: _ingredientController,
                    decoration: InputDecoration(
                      labelText: 'Ingredients (comma separated)',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ingredients';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),

                  // Submit Button
                  BlocBuilder<CreateRecipeBloc, CreateRecipeState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is CreateRecipeLoading
                            ? null
                            : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<CreateRecipeBloc>().add(
                              SubmitRecipeEvent(
                                name: _nameController.text,
                                servings: int.parse(_servingsController.text),
                                cookTime: int.parse(_cookTimeController.text),
                                ingredients: _ingredientController.text
                                    .split(',')
                                    .map((e) => e.trim())
                                    .toList(),
                              ),
                            );
                          }
                        },
                        child: state is CreateRecipeLoading
                            ? CircularProgressIndicator()
                            : Text('Create Recipe'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 48),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}