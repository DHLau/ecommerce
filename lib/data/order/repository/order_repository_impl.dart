import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/data/order/model/product_ordered.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProduct() async {
    var data = await sl<OrderFirebaseService>().getCartProduct();
    return data.fold((error) {
      return Left(error);
    }, (value) {
      return Right(
        List.from(value)
            .map((e) => ProductOrderedModel.fromMap(e).toEntity())
            .toList(),
      );
    });
  }
}
