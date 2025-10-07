part of 'home_bloc.dart';

class HomeEvent {}

class FetchDataEvent extends HomeEvent {}

class SwitchTabEvent extends HomeEvent {
  final int index;
  SwitchTabEvent({
    this.index = 0,
  });
}
