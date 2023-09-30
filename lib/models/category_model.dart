import 'package:hive/hive.dart';

part 'category_model.g.dart';

const String kCategoryBox = 'category_box';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int color;

  CategoryModel({required this.title, required this.color});
}
