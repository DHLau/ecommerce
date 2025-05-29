import 'package:flutter_bloc/flutter_bloc.dart';

class GenderselectionCubit extends Cubit<int> {
  GenderselectionCubit() : super(1);

  int selectedIndex = 1;

  void selectGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
