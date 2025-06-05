import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/helper/product/product_price.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/domain/order/usecase/add_to_cart_usecase.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/cart/pages/cart.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quanity_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            AppNavigator.push(context, CartPage());
          }
          if (state is ButtonFailureState) {
            var snackBar = SnackBar(
              content: Text(state.errorMessage),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                  usecase: AddToCartUseCase(),
                  params: AddToCartReq(
                      productId: productEntity.productId,
                      productTitle: productEntity.title,
                      productQuantity:
                          context.read<ProductQuanityCubit>().state,
                      productColor: productEntity
                          .colors[context.read<ProductColorCubit>().state]
                          .hexCode,
                      productSize: productEntity
                          .sizes[context.read<ProductSizeCubit>().state],
                      productPrice: productEntity.price.toDouble(),
                      totalPrice: productEntity.price.toDouble() *
                          ProductPriceHelper.provideCurrentPrice(productEntity),
                      productImage: productEntity.images[0],
                      createDate: DateTime.now().toString()));
            },
            content: Container(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.white));
                  }),
                  Text("Add To Bag",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
