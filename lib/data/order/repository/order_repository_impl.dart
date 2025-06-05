import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }
}
