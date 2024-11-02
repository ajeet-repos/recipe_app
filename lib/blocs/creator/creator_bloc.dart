import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/creator/creator_event.dart';
import 'package:recipe_app/blocs/creator/creator_state.dart';
import 'package:recipe_app/repositories/creator_repository.dart';

class CreatorBloc extends Bloc<CreatorEvent, CreatorState> {
  final PopularCreatorRepository repository;

  CreatorBloc({required this.repository}): super(CreatorInitial()) {
    on<FetchPopularCreators>(_onFetchPopularCreator);
  }

  FutureOr<void> _onFetchPopularCreator(
      FetchPopularCreators event,
      Emitter<CreatorState> emit) async {

    try {
      emit(CreatorLoading());

      final apiResponse = await repository.FetchPopularCreators();

      emit(CreatorLoaded(apiResponse.popularCreators));
    } catch(e) {
      emit(CreatorLoadError(e.toString()));
    }
  }
}
