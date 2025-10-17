part of 'training_detail_bloc.dart';

sealed class TrainingDetailState extends Equatable {
  const TrainingDetailState();
  
  @override
  List<Object> get props => [];
}

final class TrainingDetailInitial extends TrainingDetailState {}
