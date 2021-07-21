import 'package:alodjinha/core/http_client/http_client.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/category_list/data/datasources/get_category_list_datasource.dart';
import 'package:alodjinha/features/category_list/data/datasources/iget_category_list_datasource.dart';
import 'package:alodjinha/features/category_list/data/repositories/get_category_list_repository.dart';
import 'package:alodjinha/features/category_list/domain/repositories/iget_category_list_respository.dart';
import 'package:alodjinha/features/category_list/domain/usecases/get_category_list_usecase.dart';
import 'package:alodjinha/features/presenter/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late HttpClient client;
  // late IGetBannerListDatasource bannerDatasource;
  // late IGetBannerListRepository bannerRepository;

  late IGetCategoryListDatasource categoryDatasource;
  late IGetCategoryListRepository categoryRepository;
  late GetCategoryListUsecase categoryListUsecase;

  late HomeController controller;

  setUp(() {
    client = HttpClient();

    // bannerDatasource = GetBannerListDatasourceFromApi(client);
    // bannerRepository = GetBannerListRepository(bannerDatasource);

    categoryDatasource = GetCategoryListDatasource(client);
    categoryRepository = GetCategoryListRepository(categoryDatasource);
    categoryListUsecase = GetCategoryListUsecase(categoryRepository);

    controller = HomeController(
      // bannerListUsecase,
      categoryListUsecase,
    );
  });

  test("Testando o HomeController", () async {
    final result = await controller.categoryListUsecase(NoParams());
    result.fold((l) => null, (r) => null);
  });
}
