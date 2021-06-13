import 'dart:convert';

import 'package:alodjinha/core/errors/exceptions.dart';
import 'package:alodjinha/core/http_client/ihttp_client.dart';
import 'package:alodjinha/features/get_banner_list/data/datasources/endpoints/alodjinha_endpoints.dart';
import 'package:alodjinha/features/get_banner_list/data/datasources/iget_banner_list_datasource.dart';
import 'package:alodjinha/features/get_banner_list/data/models/banner_model.dart';

class GetBannerListDatasource implements IGetBannerListDatasource {
  final IhttpClient client;

  GetBannerListDatasource(this.client);

  Future<List<BannerModel>> getBannerList() async {
    final response = await client.get(AlodjinhaEndPoints.bannerList);

    if (response.statusCode == 200) {
      return List<BannerModel>.from(json
          .decode(response.data)["data"]
          .map((x) => BannerModel.fromJson(x)));
    } else {
      throw ServerException();
    }
  }
}
