import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckOutPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Out'),
        ),
        body: Container());
  }
}
