import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category_impl.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/data/order/repository/order_repository_impl.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/data/product/repository/product_repository_impl.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/data/product/source/product_local_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce/domain/auth/usecases/get_user.dart';
import 'package:ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:ecommerce/domain/auth/usecases/siginin.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/domain/category/usecases/get_categories.dart';
import 'package:ecommerce/domain/order/repository/order.dart';
import 'package:ecommerce/domain/order/usecase/add_to_cart_usecase.dart';
import 'package:ecommerce/domain/order/usecase/get_cart_products_usecase.dart';
import 'package:ecommerce/domain/order/usecase/order_registration.dart';
import 'package:ecommerce/domain/order/usecase/remove_cart_product.dart';
import 'package:ecommerce/domain/product/repository/product.dart';
import 'package:ecommerce/domain/product/usecases/add_or_remove_favorite.dart';
import 'package:ecommerce/domain/product/usecases/get_favorites_products.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_categoryId.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_title.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling.dart';
import 'package:ecommerce/domain/product/usecases/is_favorite.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';

// 依赖注入 = 把需要的对象（依赖）从外部“传进来”，从“自己创建”变成“别人给我”
// 这样做的好处是，当我们需要改变某个对象时，我们只需要修改这个对象的实现，而不需要修改所有依赖它的地方。
// 这句代码是创建或获取一个全局的 Service Locator（服务定位器） 实例。
// 变量 sl 只是 service locator 的简写。
final sl = GetIt.instance;

// 这个函数注册了所有依赖的服务/类（例如：服务类、仓库类、用例类）：
Future<void> initializeDependencies() async {
  initializeAuth();
  initializeCategory();
  initializeProduct();
  initializeOrder();
}

// 这个函数注册了所有与身份验证相关的服务/类：
Future<void> initializeAuth() async {
  // 注册 Auth Firebase 的实现
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseserviceImpl());
  // 注册 Auth 仓库的实现
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // UserCases 业务用例（UseCase）
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
}

// 这个函数注册了所有与 Category 相关的服务/类：
Future<void> initializeCategory() async {
// 注册 Category Firebase 的实现
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  // 注册 Category 仓库的实现
  sl.registerSingleton<CategoryRespository>(CategoryRepositoryImpl());
  // UserCases 业务用例（UseCase）
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
}

// 这个函数注册了所有与 Product 相关的服务/类：
Future<void> initializeProduct() async {
  // 注册 Product Firebase 的实现
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  // 本地实现
  sl.registerSingleton<ProductLocalService>(ProductLocalServiceImpl());

  // 注册仓库
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  // 注册 UseCase
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductByCategoryIdUseCase>(
      GetProductByCategoryIdUseCase());
  sl.registerSingleton<GetProductByTitleIdUseCase>(
      GetProductByTitleIdUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteUseCase>(
      AddOrRemoveFavoriteUseCase());
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
  sl.registerSingleton<GetFavoritesProductsUseCase>(
      GetFavoritesProductsUseCase());
}

Future<void> initializeOrder() async {
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
  sl.registerSingleton<RemoveCartProductUseCase>(RemoveCartProductUseCase());
  sl.registerSingleton<OrderRegistrationUseCase>(OrderRegistrationUseCase());
}
