import 'package:ecommerce/common/helper/color/color_helper.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorsSheet extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductColorsSheet({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Color',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return BlocBuilder<ProductColorCubit, int>(
                      builder: (ctx, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<ProductColorCubit>().itemSelection(index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: state == index
                                ? AppColors.primary
                                : AppColors.secondBackground,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productEntity.colors[index].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: ColorHelper.hexToColor(
                                        productEntity.colors[index].hexCode),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                state == index
                                    ? const Icon(
                                        Icons.check,
                                        size: 30,
                                      )
                                    : Container(
                                        width: 30,
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: productEntity.colors.length),
          )
        ],
      ),
    );
  }
}
