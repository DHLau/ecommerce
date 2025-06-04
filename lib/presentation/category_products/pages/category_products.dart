import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/category/entity/categoryEntity.dart';
import 'package:flutter/material.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  CategoryProductsPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
        ),
        body: Column(
          children: [
            _buildTitle(),
            SizedBox(
              height: 12,
            ),
          ],
        ));
  }

  Widget _buildTitle() {
    return const Text(
      "Hoodies(240)",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
