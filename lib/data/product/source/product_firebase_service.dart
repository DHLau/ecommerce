import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> getProductByTitle(String title);
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'salesNumber',
            isGreaterThanOrEqualTo: 100,
          )
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2025, 01, 01))
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getProductByCategoryId(String categoryId) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getProductByTitle(String title) async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }
}
