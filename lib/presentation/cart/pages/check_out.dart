import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  CheckOutPage({super.key, required this.products});

  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          title: Text('Check Out'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _addressField(context),
            ],
          ),
        ));
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressController,
      minLines: 2,
      maxLength: 4,
      decoration: InputDecoration(hintText: "Shipping Address"),
    );
  }
}
