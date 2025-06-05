import 'package:ecommerce/domain/order/usecase/get_cart_products_usecase.dart';
import 'package:ecommerce/domain/order/usecase/remove_cart_product.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductLoading());

  void displayCartProducts() async {
    var returedData = await sl<GetCartProductsUseCase>().call();
    returedData.fold((error) {
      emit(CartProductFailure(errorMessage: error));
    }, (data) {
      emit(CartProductLoaded(products: data));
    });
  }

  void removeCartProduct(String id) async {
    emit(CartProductLoading());
    var returedData = await sl<RemoveCartProductUseCase>().call(params: id);
    returedData.fold((error) {
      emit(CartProductFailure(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
