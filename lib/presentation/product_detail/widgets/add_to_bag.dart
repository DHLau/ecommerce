import 'package:ecommerce/common/helper/product/product_price.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quanity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuanityCubit, int>(builder: (ctx, state) {
                final price =
                    (ProductPriceHelper.provideCurrentPrice(productEntity) *
                        state);
                return Text("\$${price.toString()}",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14));
              }),
              Text("Add To Bag",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
