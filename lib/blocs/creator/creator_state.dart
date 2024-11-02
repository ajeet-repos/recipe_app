import 'package:equatable/equatable.dart';
import 'package:recipe_app/models/creator.dart';

abstract class CreatorState extends Equatable {
  const CreatorState();

  @override
  List<Object?> get props => [];
}

class CreatorInitial extends CreatorState {}
class CreatorLoading extends CreatorState {}
class CreatorLoaded extends CreatorState {
  final List<Creator> popularCreator;

  const CreatorLoaded(this.popularCreator);
}

class CreatorLoadError extends CreatorState {
  final String errorMsg;

  const CreatorLoadError(this.errorMsg);
}