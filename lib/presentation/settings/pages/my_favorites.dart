import 'package:ecommerce/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/index.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("My Favorites"),
      ),
      body: BlocProvider(
          create: (context) =>
              ProductsDisplayCubit(useCase: sl<GetFavoritesProductsUseCase>())
                ..displayProducts(),
          child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
              builder: (context, state) {
            if (state is ProcuctLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoadedState) {
              return Container(
                height: 300,
                width: double.infinity,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        entity: state.products[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12,
                      );
                    },
                    itemCount: state.products.length),
              );
            }
            return Container();
          })),
    );
  }
}
