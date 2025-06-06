// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce/data/order/model/product_ordered.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createDate;
  final int itemCount;
  final double totalPrice;
  final String address;

  OrderRegistrationReq(
      {required this.products,
      required this.createDate,
      required this.itemCount,
      required this.totalPrice,
      required this.address});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.fromEntity().toMap()).toList(),
      'createDate': createDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'address': address,
    };
  }
}
