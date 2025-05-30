import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:ecommerce/domain/auth/usecases/siginin.dart';
import 'package:get_it/get_it.dart';
import 'package:ecommerce/domain/auth/usecases/signup.dart';

// 依赖注入 = 把需要的对象（依赖）从外部“传进来”，从“自己创建”变成“别人给我”
// 这样做的好处是，当我们需要改变某个对象时，我们只需要修改这个对象的实现，而不需要修改所有依赖它的地方。
// 这句代码是创建或获取一个全局的 Service Locator（服务定位器） 实例。
// 变量 sl 只是 service locator 的简写。
final sl = GetIt.instance;

// 这个函数注册了所有依赖的服务/类（例如：服务类、仓库类、用例类）：
Future<void> initializeDependencies() async {
  // Services
  // 注册 Auth Firebase 的实现
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseserviceImpl());

  // Responsitories
  // 注册 Auth 仓库的实现
  // 这是面向接口编程（依赖倒置原则）的一种常见做法
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // UserCases 业务用例（UseCase）
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
