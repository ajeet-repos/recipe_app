// import 'package:flutter/material.dart';
//
// import '../../models/recipe.dart';
//
// class CreateRecipeScreen extends StatefulWidget {
//   @override
//   _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
// }
//
// class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late String _recipeName;
//   late List<String> _ingredients;
//   late List<String> _instructions;
//
//   @override
//   void initState() {
//     super.initState();
//     _ingredients = [];
//     _instructions = [];
//   }
//
//   void _addIngredient() {
//     setState(() {
//       _ingredients.add('');
//     });
//   }
//
//   void _addInstruction() {
//     setState(() {
//       _instructions.add('');
//     });
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       // Create a new recipe using the form data
//       final recipe = Recipe(
//         name: _recipeName,
//         ingredients: _ingredients,
//         instructions: _instructions,
//         id: '1',
//         imageUrl: '', author: '', rating: 4.5, cookTime: 30,
//       );
//       // Dispatch the recipe creation event using BLoC
//       // context.read<RecipeBloc>().add(CreateRecipe(recipe));
//
//       // Navigate back to the home screen
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Recipe'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Recipe Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a recipe name';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _recipeName = value!;
//                   },
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Ingredients',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 ..._ingredients.map((ingredient) {
//                   return TextFormField(
//                     decoration: InputDecoration(labelText: 'Ingredient'),
//                     onChanged: (value) {
//                       ingredient = value;
//                     },
//                   );
//                 }).toList(),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: _addIngredient,
//                   child: Text('Add Ingredient'),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Instructions',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 ..._instructions.map((instruction) {
//                   return TextFormField(
//                     decoration: InputDecoration(labelText: 'Instruction'),
//                     onChanged: (value) {
//                       instruction = value;
//                     },
//                   );
//                 }).toList(),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: _addInstruction,
//                   child: Text('Add Instruction'),
//                 ),
//                 SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Create Recipe'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }