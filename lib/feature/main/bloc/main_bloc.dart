import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SwitchTabEvent>((event, emit) {
      int index = event.index;
      emit(state.copyWith(currentIndex: index));
    });
  }
}
