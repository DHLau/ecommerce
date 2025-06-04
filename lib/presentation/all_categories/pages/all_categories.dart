import 'package:ecommerce/common/bloc/category/category_display_cubit.dart';
import 'package:ecommerce/common/bloc/category/category_display_state.dart';
import 'package:ecommerce/common/helper/images/image_display.dart';
import 'package:ecommerce/common/index.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/category/entity/categoryEntity.dart';
import 'package:ecommerce/presentation/category_products/pages/category_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: false,
      ),
      body: BlocProvider(
        create: (context) => CategoryDisplayCubit()..displayCategories(),
        child: BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
          builder: (ctx, state) {
            if (state is CategoryLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CategoryLoadedState) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTitle(),
                    SizedBox(
                      height: 12,
                    ),
                    _buildCategories(context, state.categories)
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text("Shop by Category",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _buildCategories(
      BuildContext context, List<CategoryEntity> categories) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return GestureDetector(
                onTap: () {
                  AppNavigator.push(
                      context,
                      CategoryProductsPage(
                        categoryEntity: categories[index],
                      ));
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: NetworkImage(
                              ImageDisplayHelper.generateCategoryImageURL(
                                  categories[index].image),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        categories[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ));
          },
          separatorBuilder: (ctx, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: categories.length),
    );
  }
}
