import 'package:ecommerce/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce/common/helper/color/color_helper.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_cubit.dart';
import 'package:ecommerce/presentation/product_detail/widgets/sheets/product_colors_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedColors extends StatelessWidget {
  final ProductEntity productEntity;
  const SelectedColors({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          AppBottomsheet.display(
              context,
              BlocProvider.value(
                  value: BlocProvider.of<ProductColorCubit>(context),
                  child: ProductColorsSheet(
                    productEntity: productEntity,
                  )));
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.secondBackground),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Color",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              Row(
                children: [
                  BlocBuilder<ProductColorCubit, int>(
                    builder: (context, state) {
                      return Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: ColorHelper.hexToColor(
                              productEntity.colors[state].hexCode),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
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
