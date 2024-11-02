import 'package:flutter/material.dart';
import 'package:recipe_app/models/creator.dart';

class CreatorCard extends StatelessWidget {
  final Creator creator;

  const CreatorCard({Key? key, required this.creator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(creator.imgUrl),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: 12),
          Center(  // Add this wrapper
            child: Text(
              creator.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,  // Also add this
            ),
          ),
        ],
      ),
    );
  }
}