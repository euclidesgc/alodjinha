import 'package:alodjinha/features/get_banner_list/data/models/banner_model.dart';

abstract class IGetBannerListDatasource {
  Future<List<BannerModel>> getBannerList();
}
