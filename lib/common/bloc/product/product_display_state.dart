import 'package:ecommerce/domain/product/entity/product_entity.dart';

abstract class ProductDisplayState {}

class ProductInitialState extends ProductDisplayState {}

class ProcuctLoadingState extends ProductDisplayState {}

class ProductsLoadedState extends ProductDisplayState {
  final List<ProductEntity> products;
  ProductsLoadedState({required this.products});
}

class ProductLoadFailureState extends ProductDisplayState {}
