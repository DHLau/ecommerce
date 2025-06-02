import 'package:ecommerce/common/bloc/category/category_display_cubit.dart';
import 'package:ecommerce/common/bloc/category/category_display_state.dart';
import 'package:ecommerce/common/helper/images/image_display.dart';
import 'package:ecommerce/domain/category/entity/categoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoryDisplayCubit()..displayCategories(),
        child: BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
            builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryLoadedState) {
            return Column(
              children: [
                _title(),
                SizedBox(
                  height: 12,
                ),
                _categories(state.categories),
              ],
            );
          }
          return Center();
        }));
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'See All',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return Column(children: [
              // 实现原形图片的一种方式
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                          ImageDisplayHelper.generateCategoryImageURL(
                              categories[index].image),
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                categories[index].title,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemCount: categories.length),
    );
  }
}
