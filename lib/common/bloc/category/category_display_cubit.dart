import 'package:ecommerce/common/bloc/category/category_display_state.dart';
import 'package:ecommerce/domain/category/usecases/get_categories.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoryDisplayCubit() : super(CategoryLoadingState());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold((error) {
      emit(CategoryLoadFailureState());
    }, (data) {
      emit(CategoryLoadedState(categories: data));
    });
  }
}
