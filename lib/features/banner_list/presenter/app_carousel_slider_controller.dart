import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/banner_list/domain/entities/banner_entity.dart';
import 'package:alodjinha/features/banner_list/domain/usecases/get_banner_list_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

/*
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
*/

part 'app_carousel_slider_controller.g.dart';

class AppCarouselSliderController = AppCarouselSliderControllerBase
    with _$AppCarouselSliderController;

abstract class AppCarouselSliderControllerBase with Store {
  final GetBannerListUsecase bannerListUsecase;

  AppCarouselSliderControllerBase(this.bannerListUsecase);

  @observable
  bool loading = false;

  @observable
  List<BannerEntity> bannerList = [];

  @observable
  Option<Failure> bannerListFailure = none();

  @action
  getBannerList() async {
    var result = await bannerListUsecase(NoParams());

    result.fold((failureResult) {
      bannerListFailure = optionOf(failureResult);
    }, (list) {
      bannerList.clear();
      bannerList = list;
    });
  }
}
