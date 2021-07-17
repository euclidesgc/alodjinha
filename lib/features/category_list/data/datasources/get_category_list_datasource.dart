import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/ihttp_client.dart';
import '../models/category_model.dart';
import 'endpoints/category_endpoints.dart';
import 'iget_category_list_datasource.dart';

class GetCategoyListDatasource implements IGetCategoryListDatasource {
  final IhttpClient client;

  GetCategoyListDatasource(this.client);

  @override
  Future<List<CategoryModel>> getCategoryList() async {
    final response = await client.get(CategoryEndPoints.categoryList);

    if (response.statusCode == 200) {
      return List<CategoryModel>.from(json
          .decode(response.data)["data"]
          .map((x) => CategoryModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
