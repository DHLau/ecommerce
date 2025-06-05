import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
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
              return _buildCartProductList();
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

  Widget _buildCartProductList() {
    return Container();
  }

  Widget _buildCartEmpty() {
    return Container();
  }
}
