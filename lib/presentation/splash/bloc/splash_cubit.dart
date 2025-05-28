import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(UnAuthenticated());
  }
}
