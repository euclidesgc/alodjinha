// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_carousel_slider_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppCarouselSliderController on AppCarouselSliderControllerBase, Store {
  final _$loadingAtom = Atom(name: 'AppCarouselSliderControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$bannerListAtom =
      Atom(name: 'AppCarouselSliderControllerBase.bannerList');

  @override
  List<BannerEntity> get bannerList {
    _$bannerListAtom.reportRead();
    return super.bannerList;
  }

  @override
  set bannerList(List<BannerEntity> value) {
    _$bannerListAtom.reportWrite(value, super.bannerList, () {
      super.bannerList = value;
    });
  }

  final _$bannerListFailureAtom =
      Atom(name: 'AppCarouselSliderControllerBase.bannerListFailure');

  @override
  Option<Failure> get bannerListFailure {
    _$bannerListFailureAtom.reportRead();
    return super.bannerListFailure;
  }

  @override
  set bannerListFailure(Option<Failure> value) {
    _$bannerListFailureAtom.reportWrite(value, super.bannerListFailure, () {
      super.bannerListFailure = value;
    });
  }

  final _$getBannerListAsyncAction =
      AsyncAction('AppCarouselSliderControllerBase.getBannerList');

  @override
  Future getBannerList() {
    return _$getBannerListAsyncAction.run(() => super.getBannerList());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
bannerList: ${bannerList},
bannerListFailure: ${bannerListFailure}
    ''';
  }
}
