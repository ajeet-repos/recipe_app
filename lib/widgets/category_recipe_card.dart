import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class CategoryRecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool isFavorite = false;
  final VoidCallback onFavoritePressed;

  const CategoryRecipeCard({
    Key? key,
    required this.recipe,
    required this.onFavoritePressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 300,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bottom card with rounded corners
          Positioned(
            top: 80, // Adjust to control image overlap
            child: Container(
              width: 180,
              height: 230,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  // Recipe name
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  // Cook time and favorite button row
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Cook time
                        Column(
                          children: [
                            Text(
                              'Time',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${recipe.cookTime} Mins',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        // Favorite button
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              size: 18,
                              color: isFavorite ? Colors.red : Colors.black,
                            ),
                            onPressed: onFavoritePressed,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Top circular image
          Positioned(
            top: 0,
            left: 20, // Center the circle on the card
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: ClipOval(
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}