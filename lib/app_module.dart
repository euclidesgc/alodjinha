import 'package:alodjinha/features/banner_list/data/datasources/get_banner_list_datasource_from_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/http_client/http_client.dart';
import 'features/banner_list/data/repositories/get_banner_list_repository.dart';
import 'features/banner_list/domain/usecases/get_banner_list_usecase.dart';
import 'features/banner_list/presenter/app_carousel_slider_controller.dart';
import 'features/category_list/data/datasources/get_category_list_datasource.dart';
import 'features/category_list/data/repositories/get_category_list_repository.dart';
import 'features/category_list/domain/usecases/get_category_list_usecase.dart';
import 'features/presenter/home/home_controller.dart';
import 'features/presenter/home/home_page.dart';
import 'features/presenter/sobre/sobre_page.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind((i) => HttpClient()),
        Bind((i) => GetBannerListDatasourceFromApi(i())),
        Bind((i) => GetBannerListRepository(i())),
        Bind((i) => GetBannerListUsecase(i())),
        Bind((i) => GetCategoryListDatasource(i())),
        Bind((i) => GetCategoryListRepository(i())),
        Bind((i) => GetCategoryListUsecase(i())),
        Bind((i) => HomeController(i())),
        Bind((i) => AppCarouselSliderController(i())),
      ];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => HomePage()),
        ChildRoute("/sobre", child: (_, __) => SobrePage()),
      ];
}
