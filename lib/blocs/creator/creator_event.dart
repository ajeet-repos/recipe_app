import 'package:equatable/equatable.dart';

abstract class CreatorEvent extends Equatable {
  const CreatorEvent();

  @override
  List<Object?> get props => [];
}

class FetchPopularCreators extends CreatorEvent {}