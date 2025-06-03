import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductInitialState());

  void displayInitial() {
    emit(ProductInitialState());
  }

  void displayProducts({dynamic params}) async {
    emit(ProcuctLoadingState());
    var returnedData = await useCase.call(params: params);
    returnedData.fold((error) {
      emit(ProductLoadFailureState());
    }, (data) {
      emit(ProductsLoadedState(products: data));
    });
  }
}
