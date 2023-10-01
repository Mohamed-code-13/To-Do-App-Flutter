part of 'add_category_cubit.dart';

abstract class AddCategoryState {}

class AddCategoryInitialState extends AddCategoryState {}

class AddCategoryLoadingState extends AddCategoryState {}

class AddCategorySuccessState extends AddCategoryState {}

class AddCategoryFailureState extends AddCategoryState {
  final String errorMsg;

  AddCategoryFailureState(this.errorMsg);
}
