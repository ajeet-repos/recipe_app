import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/creator/creator_bloc.dart';
import 'package:recipe_app/blocs/creator/creator_event.dart';
import 'package:recipe_app/blocs/creator/creator_state.dart';
import 'package:recipe_app/widgets/creator_card.dart';

class PopularCreatorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular creators',
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
        SizedBox(
          height: 160,
          child: BlocBuilder<CreatorBloc, CreatorState>(
            builder: (context, state) {
              if (state is CreatorInitial) {
                context.read<CreatorBloc>().add(FetchPopularCreators());
                return Center(child: CircularProgressIndicator());
              } else if (state is CreatorLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CreatorLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: state.popularCreator.length,
                  itemBuilder: (context, index) {
                    final creator = state.popularCreator[index];
                    return CreatorCard(creator: creator);
                  },
                );
              } else if (state is CreatorLoadError) {
                return Center(
                  child: Text(
                    'Error: ${state.errorMsg}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}