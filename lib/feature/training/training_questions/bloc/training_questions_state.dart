part of 'training_questions_bloc.dart';

sealed class TrainingQuestionsState extends Equatable {
  const TrainingQuestionsState();
  
  @override
  List<Object> get props => [];
}

final class TrainingQuestionsInitial extends TrainingQuestionsState {}
