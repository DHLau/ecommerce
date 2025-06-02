import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/category/models/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRespository {
  @override
  Future<Either> getCategories() async {
    var category = await sl<CategoryFirebaseService>().getCategories();
    return category.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        CategoryModel.fromMap(data).toEntity(),
      );
    });
  }
}
