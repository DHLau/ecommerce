import 'package:ecommerce/common/index.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("My Favorites"),
      ),
      body: Container(
        child: Text("My Favorites"),
      ),
    );
  }
}
