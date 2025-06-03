import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/service_locator.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var data = await sl<ProductFirebaseService>().getTopSelling();
    return data.fold((error) {
      return Left(error);
    }, (value) {
      return Right(value);
    });
  }
}
