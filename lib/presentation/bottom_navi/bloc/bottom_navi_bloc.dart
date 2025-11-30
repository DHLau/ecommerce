import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_navi_event.dart';
import 'bottom_navi_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavState(0)) {
    on<BottomNavChanged>((event, emit) {
      emit(BottomNavState(event.index));
    });
  }
}
