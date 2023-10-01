import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/category_model.dart';

part 'read_category_state.dart';

class ReadCategoryCubit extends Cubit<ReadCategoryState> {
  ReadCategoryCubit() : super(ReadCategoryInitialState());

  List<CategoryModel> categoreis = [];

  void getAllCategories() {
    emit(ReadCategoryLoadingState());

    var categoryBox = Hive.box<CategoryModel>(kCategoryBox);

    categoreis = categoryBox.values.toList();

    emit(ReadCategorySuccessState());
  }
}
