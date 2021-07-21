import 'dart:convert';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/http_client/ihttp_client.dart';
import '../models/banner_model.dart';
import 'endpoints/banner_endpoints.dart';
import 'iget_banner_list_datasource.dart';

class GetBannerListDatasourceFromApi implements IGetBannerListDatasource {
  final IhttpClient client;

  GetBannerListDatasourceFromApi(this.client);

  Future<List<BannerModel>> getBannerList() async {
    final response = await client.get(BannerEndPoints.bannerList);

    if (response.statusCode == 200) {
      return List<BannerModel>.from(json
          .decode(response.data)["data"]
          .map((item) => BannerModel.fromJson(item)));
    } else {
      throw ServerException();
    }
  }
}
