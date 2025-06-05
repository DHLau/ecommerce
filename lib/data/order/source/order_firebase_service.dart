import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReq addToCartReq);
  Future<Either> getCartProduct();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCartReq.toMap());
      return Right("Add to cart successfully");
    } catch (e) {
      return Left("Please try again later");
    }
  }

  @override
  Future<Either> getCartProduct() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .get();
      return Right(returnData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left("Please try again later");
    }
  }
}
