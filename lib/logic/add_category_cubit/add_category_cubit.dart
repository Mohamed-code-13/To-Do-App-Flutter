import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/category_model.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(AddCategoryInitialState());

  Future<void> addCategory(CategoryModel category) async {
    try {
      emit(AddCategoryLoadingState());
      var categoryBox = Hive.box<CategoryModel>(kCategoryBox);

      await categoryBox.add(category);

      emit(AddCategorySuccessState());
    } catch (e) {
      emit(AddCategoryFailureState('Something went wrong! Please try again.'));
    }
  }
}
