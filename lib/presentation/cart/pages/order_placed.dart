import 'package:ecommerce/common/index.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: Scaffold(
          body: Center(
        child: Text("OrderPlacedPage"),
      )),
    );
  }
}
