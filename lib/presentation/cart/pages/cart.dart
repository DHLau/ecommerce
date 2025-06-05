import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:ecommerce/presentation/cart/Widgets/check_out.dart';
import 'package:ecommerce/presentation/cart/Widgets/product_ordered_card.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
          title: Text("Cart"),
        ),
        body: BlocProvider(
          create: (context) =>
              CartProductsDisplayCubit()..displayCartProducts(),
          child:
              BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
                  builder: (context, state) {
            if (state is CartProductLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductLoaded) {
              return Stack(children: [
                _buildCartProductList(context, state.products),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _checkOut(state.products),
                )
              ]);
            }
            if (state is CartProductFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          }),
        ));
  }

  Widget _buildCartProductList(
      BuildContext context, List<ProductOrderedEntity> products) {
    return ListView.separated(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 3.5),
        itemBuilder: (context, index) {
          return ProductOrderedCard(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: products.length);
  }

  Widget _checkOut(List<ProductOrderedEntity> products) {
    return Checkout(products: products);
  }

  Widget _buildCartEmpty() {
    return Container();
  }
}
