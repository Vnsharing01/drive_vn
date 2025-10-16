part of 'main_bloc.dart';

 class MainEvent {
  const MainEvent();


}
class SwitchTabEvent extends MainEvent {
  final int index;
  SwitchTabEvent({
    this.index = 0,
  });
}