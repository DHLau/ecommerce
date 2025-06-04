import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_images.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_price.dart';
import 'package:ecommerce/presentation/product_detail/widgets/selected_color.dart';
import 'package:ecommerce/presentation/product_detail/widgets/selected_quantity.dart';
import 'package:ecommerce/presentation/product_detail/widgets/selected_sizes.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_title.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductTitle(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductPrice(productEntity: productEntity),
              const SizedBox(
                height: 20,
              ),
              SelectedSizes(productEntity: productEntity),
              const SizedBox(
                height: 20,
              ),
              SelectedColors(productEntity: productEntity),
              const SizedBox(
                height: 20,
              ),
              SelectedQuantity(productEntity: productEntity),
            ],
          ),
        ));
  }
}
