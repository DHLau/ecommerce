import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeCubit extends Cubit<int> {
  ProductSizeCubit() : super(0);

  int selectedIndex = 0;

  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
