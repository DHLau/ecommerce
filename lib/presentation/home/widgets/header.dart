import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/core/configs/assets/app_images.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/auth/entity/user_entity.dart';
import 'package:ecommerce/presentation/cart/pages/cart.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // 注入阶段就调用了获取数据的方法
      // 注意：这里的context是BlocProvider的context，不是build方法的context
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileImage(state.user, context),
                  _gender(state.user, context),
                  _cart(context),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(UserEntity user, BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: user.image.isEmpty
                  ? AssetImage(AppImages.profile)
                  : NetworkImage(user.image)),
          shape: BoxShape.circle,
        ));
  }

  Widget _gender(UserEntity user, BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _cart(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const CartPage());
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            color: AppColors.primary, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppVectors.bag,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
