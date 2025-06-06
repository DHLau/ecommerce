import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quanity_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_cubit.dart';
import 'package:ecommerce/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:ecommerce/presentation/product_detail/widgets/favorite_button.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_color.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_images.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_price.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_sizes.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuanityCubit(),
        ),
        BlocProvider(create: (context) => ProductColorCubit()),
        BlocProvider(create: (context) => ProductSizeCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(
            create: (context) =>
                FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
          appBar: BasicAppBar(
            hideBack: false,
            action: FavoriteButton(
              productEntity: productEntity,
            ),
          ),
          bottomNavigationBar: AddToBag(
            productEntity: productEntity,
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
                ProductSizes(productEntity: productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductColor(productEntity: productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductQuantity(productEntity: productEntity),
              ],
            ),
          )),
    );
  }
}
