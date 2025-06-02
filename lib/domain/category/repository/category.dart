import 'package:dartz/dartz.dart';

abstract class CategoryRespository {
  Future<Either> getCategories();
}
