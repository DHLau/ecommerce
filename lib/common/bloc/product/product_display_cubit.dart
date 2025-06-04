import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/helper/debounce_throttle_helper.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductDisplayState> {
  final UseCase useCase;
  ProductsDisplayCubit({required this.useCase}) : super(ProductInitialState());

  final _helper = DebounceThrottleHelper(); // 添加辅助类

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

  // 添加防抖
  void displayProductsWithDebounce({dynamic params}) {
    _helper.runDebounce(() async {
      emit(ProcuctLoadingState());

      final result = await useCase.call(params: params);
      result.fold(
        (error) => emit(ProductLoadFailureState()),
        (data) => emit(ProductsLoadedState(products: data)),
      );
    });
  }

  // 添加节流
  void displayProductsWithThrottle({dynamic params}) {
    _helper.runThrottle(() async {
      emit(ProcuctLoadingState());

      final result = await useCase.call(params: params);
      result.fold(
        (error) => emit(ProductLoadFailureState()),
        (data) => emit(ProductsLoadedState(products: data)),
      );
    });
  }

  @override
  Future<void> close() {
    _helper.dispose();
    return super.close();
  }
}
