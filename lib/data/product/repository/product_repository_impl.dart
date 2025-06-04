import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/models/product_model.dart';
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
      return Right(
        List.from(value)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList(),
      );
    });
  }

  @override
  Future<Either> getNewIn() async {
    var data = await sl<ProductFirebaseService>().getNewIn();
    return data.fold((error) {
      return Left(error);
    }, (value) {
      return Right(
        List.from(value)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList(),
      );
    });
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    var data =
        await sl<ProductFirebaseService>().getProductByCategoryId(categoryId);
    return data.fold((error) {
      return Left(error);
    }, (value) {
      return Right(
        List.from(value)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList(),
      );
    });
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    var data = await sl<ProductFirebaseService>().getProductByTitle(title);
    return data.fold((error) {
      return Left(error);
    }, (value) {
      return Right(
        List.from(value)
            .map((e) => ProductModel.fromMap(e).toEntity())
            .toList(),
      );
    });
  }
}
