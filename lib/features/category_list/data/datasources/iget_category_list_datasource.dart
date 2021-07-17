import '../models/category_model.dart';

abstract class IGetCategoryListDatasource {
  Future<List<CategoryModel>> getCategoryList();
}
