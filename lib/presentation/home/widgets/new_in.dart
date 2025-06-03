import 'package:ecommerce/common/bloc/product/product_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/product_display_state.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetNewInUseCase>())
        ..displayProducts(),
      child: BlocBuilder<ProductsDisplayCubit, ProductDisplayState>(
        builder: (context, state) {
          if (state is ProcuctLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildTopSelling(),
                SizedBox(
                  height: 20,
                ),
                _buildProducts(state.products),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildTopSelling() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "New In",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.primary),
      ),
    );
  }

  Widget _buildProducts(List<ProductEntity> products) {
    return SizedBox(
        height: 300,
        width: double.infinity,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return ProductCard(entity: products[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            itemCount: products.length));
  }
}
