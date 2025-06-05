import 'package:ecommerce/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_cubit.dart';
import 'package:ecommerce/presentation/product_detail/widgets/sheets/product_size_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
            context,
            // 获取已经存在的cubit
            // 这段代码是 Flutter 中使用 BlocProvider.value 包装一个子组件的典型写法，
            // 它的目的是将一个已经存在的 Cubit（或 Bloc）实例传递给子组件，
            // 让子组件能够访问和响应这个状态。
            BlocProvider.value(
              value: BlocProvider.of<ProductSizeCubit>(context),
              child: ProductSizeSheet(productEntity: productEntity),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.secondBackground),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Size",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              Row(
                children: [
                  BlocBuilder<ProductSizeCubit, int>(
                    builder: (context, state) => Text(
                      productEntity.sizes[state],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
