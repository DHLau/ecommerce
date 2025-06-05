import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

abstract class CartProductsDisplayState {}

class CartProductLoading extends CartProductsDisplayState {}

class CartProductLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;
  CartProductLoaded({required this.products});
}

class CartProductFailure extends CartProductsDisplayState {
  final String errorMessage;
  CartProductFailure({required this.errorMessage});
}
