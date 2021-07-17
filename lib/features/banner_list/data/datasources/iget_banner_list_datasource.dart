import '../models/banner_model.dart';

abstract class IGetBannerListDatasource {
  Future<List<BannerModel>> getBannerList();
}
