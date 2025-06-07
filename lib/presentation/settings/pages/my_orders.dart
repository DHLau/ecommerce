import 'package:ecommerce/common/index.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text("My Orders")),
      body: Container(
        child: Text("My Orders"),
      ),
    );
  }
}
