part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LatestTestModel? latestTestModel;
  final bool isLoading;
  final String? error;
  final int currentIndex;

  const HomeState({
    this.latestTestModel,
    this.isLoading = false,
    this.error,
    this.currentIndex = 0,
  });

  HomeState copyWith({
    LatestTestModel? latestTestModel,
    bool? isLoading,
    String? error,
    int? currentIndex,
  }) {
    return HomeState(
      latestTestModel: latestTestModel ?? this.latestTestModel,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
        latestTestModel,
        isLoading,
        error,
        currentIndex,
      ];
}
