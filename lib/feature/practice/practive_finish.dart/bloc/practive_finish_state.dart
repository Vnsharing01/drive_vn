part of 'practive_finish_bloc.dart';

class PractiveFinishState extends Equatable {
  final bool isLoading;
  final bool isPassed;
  const PractiveFinishState({
    this.isLoading = false,
    this.isPassed = true,
  });

  PractiveFinishState copyWith({
    bool? isLoading,
    bool? isPassed,
  }) {
    return PractiveFinishState(
      isLoading: isLoading ?? this.isLoading,
      isPassed: isPassed ?? this.isPassed,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isPassed,
      ];
}
