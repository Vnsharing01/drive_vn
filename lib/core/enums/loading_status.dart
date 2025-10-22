enum LoadingStatus {
  inital,
  loading,
  success,
  failure,
}

extension LoadingStatusExtension on LoadingStatus {
  bool get isLoading =>
      this == LoadingStatus.loading || this == LoadingStatus.inital;
  bool get isSuccess => this == LoadingStatus.success;
  bool get isFailure => this == LoadingStatus.failure;
}
