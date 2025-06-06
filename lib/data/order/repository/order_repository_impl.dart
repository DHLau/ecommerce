import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/data/order/model/order_registration_req.dart';
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

  @override
  Future<Either> removeCartProduct(String id) async {
    var returedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<Either> orderRegistration(
      OrderRegistrationReq orderRegistrationReq) async {
    var data = await sl<OrderFirebaseService>()
        .orderRegistration(orderRegistrationReq);
    return data.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }
}
