import 'package:ecommerce/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/category/entity/categoryEntity.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_categoryId.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  CategoryProductsPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppBar(
          hideBack: false,
        ),
        body: BlocProvider(
            create: (context) => ProductsDisplayCubit(
                useCase: sl<GetProductByCategoryIdUseCase>())
              ..displayProducts(params: categoryEntity.categoryId),
            child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
              builder: (ctx, state) {
                if (state is ProcuctLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductsLoadedState) {
                  if (state.products.isEmpty) {
                    return Center(
                      child: Text(
                        "No Products Found",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(state.products),
                        SizedBox(
                          height: 12,
                        ),
                        _buildProducts(context, state.products),
                      ],
                    ),
                  );
                }
                return Container();
              },
            )));
  }

  Widget _buildTitle(List<ProductEntity> products) {
    return Text(
      "${categoryEntity.title}(${products.length})",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProducts(BuildContext context, List<ProductEntity> products) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6),
      itemBuilder: (ctx, index) {
        return ProductCard(entity: products[index]);
      },
      itemCount: products.length,
    ));
  }
}
