import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
}

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnData = await FirebaseFirestore.instance
          .collection('Products')
          .where(
            'salesNumber',
            isGreaterThanOrEqualTo: 2,
          )
          .get();
      return Right(returnData);
    } catch (e) {
      return Left("Please try again later");
    }
  }
}
