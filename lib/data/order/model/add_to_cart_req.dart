// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddToCartReq {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createDate;

  AddToCartReq({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createDate': createDate,
    };
  }

  factory AddToCartReq.fromMap(Map<String, dynamic> map) {
    return AddToCartReq(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createDate: map['createDate'] as String,
    );
  }
}
