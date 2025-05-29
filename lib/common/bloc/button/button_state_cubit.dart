import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({required UseCase usecase, dynamic params}) async {
    // 在执行之前, 先将状态置为loading
    emit(ButtonLoadingState());
    // 实现了抽象类的方法, 通过协议进行方法的调用
    try {
      // 执行usecase的call方法, 并将返回的数据赋值给returnedData
      // Either是一个泛型类, 有两个类型参数, 分别是Left和Right
      // Left表示错误, Right表示正确
      Either returnedData = await usecase.call(params: params);
      // 对返回的数据进行处理
      // 这里的fold方法, 是Either的方法, 用于处理Either的两种状态
      // 如果是Left, 则执行第一个函数, 如果是Right, 则执行第二个函数
      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
