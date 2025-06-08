// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class ProductDetailPage extends StatefulWidget {
  final ProductEntity productEntity;
  final Function? onFavoriteToggled;

  const ProductDetailPage(
      {super.key, required this.productEntity, this.onFavoriteToggled});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool _favorChanged = false;

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
                FavoriteIconCubit()..isFavorite(widget.productEntity.productId))
      ],
      child: Scaffold(
          appBar: BasicAppBar(
            hideBack: false,
            action: FavoriteButton(
              productEntity: widget.productEntity,
              onTap: () => _favorChanged = true,
            ),
            backClick: () {
              // 这里
              if (_favorChanged && widget.onFavoriteToggled != null) {
                widget.onFavoriteToggled!();
                Navigator.pop(context);
              }
            },
          ),
          bottomNavigationBar: AddToBag(
            productEntity: widget.productEntity,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImages(productEntity: widget.productEntity),
                const SizedBox(
                  height: 10,
                ),
                ProductTitle(productEntity: widget.productEntity),
                const SizedBox(
                  height: 10,
                ),
                ProductPrice(productEntity: widget.productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductSizes(productEntity: widget.productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductColor(productEntity: widget.productEntity),
                const SizedBox(
                  height: 20,
                ),
                ProductQuantity(productEntity: widget.productEntity),
              ],
            ),
          )),
    );
  }
}
