import 'package:ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
