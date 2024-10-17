import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/blocs/trending/trending_event.dart';
import 'package:recipe_app/blocs/trending/trending_state.dart';
import 'package:recipe_app/repositories/trending_repository.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final TrendingRepository repository;

  TrendingBloc(this.repository) : super(TrendingInitial()) {
    on<LoadTrendingRecipes>(_onLoadTrendingRecipes);
    on<RefreshTrendingRecipes>(_onRefreshTrendingRecipes);
  }

  Future<void> _onLoadTrendingRecipes(
      LoadTrendingRecipes event, Emitter<TrendingState> emit) async {
    emit(TrendingLoading());
    try {
      final response = await repository.getTrendingRecipes();
      emit(TrendingLoaded(response.trending));
    } catch (e, stacktrace) {
      print(stacktrace);
      emit(TrendingError('Failed to load trending recipes: ${e.toString()}'));
    }
  }

  Future<void> _onRefreshTrendingRecipes(
    RefreshTrendingRecipes event,
    Emitter<TrendingState> emit,
  ) async {
    emit(TrendingLoading());
    try {
      final response = await repository.getTrendingRecipes();
      emit(TrendingLoaded(response.trending));
    } catch (e) {
      emit(
          TrendingError('Failed to refresh trending recipes: ${e.toString()}'));
    }
  }
}
