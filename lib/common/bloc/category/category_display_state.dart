import 'package:ecommerce/domain/category/entity/categoryEntity.dart';

abstract class CategoryDisplayState {}

class CategoryLoadingState extends CategoryDisplayState {}

class CategoryLoadedState extends CategoryDisplayState {
  final List<CategoryEntity> categories;
  CategoryLoadedState({required this.categories});
}

class CategoryLoadFailureState extends CategoryDisplayState {}
