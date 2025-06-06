import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/models/product_model.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> getTopSelling();
  Future<Either> getNewIn();
  Future<Either> getProductByCategoryId(String categoryId);
  Future<Either> getProductByTitle(String title);
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity entity);
  Future<bool> isFavorite(String productId);
  Future<Either> getFavoriteProducts();
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

  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity entity) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorite')
          .where('productId', isEqualTo: entity.productId)
          .get();
      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return Right(false);
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user!.uid)
            .collection('Favorite')
            .add(entity.fromEntity().toMap());
        return Right(true);
      }
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorite')
          .where('productId', isEqualTo: productId)
          .get();
      if (products.docs.isNotEmpty) {
        // is favorite
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorite')
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }
}
