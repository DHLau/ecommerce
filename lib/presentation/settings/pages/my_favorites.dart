import 'package:ecommerce/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/index.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce/presentation/product_detail/bloc/favorite_icon_cubit.dart';
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
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => ProductsDisplayCubit(
                    useCase: sl<GetFavoritesProductsUseCase>())
                  ..displayProducts()),
          ],
          child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
              builder: (context, state) {
            if (state is ProcuctLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoadFailureState) {
              return Center(
                child: Text("Please try again"),
              );
            }
            if (state is ProductsLoadedState) {
              return _buildProductList(state.products);
            }
            return Container();
          })),
    );
  }

  Widget _buildProductList(List<ProductEntity> products) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6),
      itemBuilder: (context, index) {
        return ProductCard(
          entity: products[index],
          needToReload: () {
            context.read<ProductsDisplayCubit>().displayProducts();
          },
        );
      },
      itemCount: products.length,
    );
  }
}
