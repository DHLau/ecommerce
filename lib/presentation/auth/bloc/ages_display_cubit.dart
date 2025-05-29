import 'package:ecommerce/presentation/auth/bloc/ages_display_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages.dart';
import '../../../service_locator.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  // displayAges 方法：业务执行 + 状态切换
  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    // fold 处理结果
    returnedData.fold(
      (message) {
        emit(AgesLoadFailure(message: message));
      },
      (data) {
        emit(AgesLoaded(ages: data));
      },
    );
  }
}
