part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LatestTestModel? latestTestModel;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.latestTestModel,
    this.isLoading = false,
    this.error,
  });

  HomeState copyWith({
    LatestTestModel? latestTestModel,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      latestTestModel: latestTestModel ?? this.latestTestModel,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        latestTestModel,
        isLoading,
        error,
      ];
}
