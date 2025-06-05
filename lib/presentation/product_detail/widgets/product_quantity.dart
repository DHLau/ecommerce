import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quanity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductQuantity({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.secondBackground),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Quantity",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ProductQuanityCubit>().decrement();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                BlocBuilder<ProductQuanityCubit, int>(
                    builder: (context, state) {
                  return Container(
                    alignment: Alignment.center,
                    width: 40,
                    child: Text(
                      "${state.toString()}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ProductQuanityCubit>().increment();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
