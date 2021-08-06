import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/category_list/domain/entities/category_entity.dart';
import 'package:alodjinha/features/category_list/domain/usecases/get_category_list_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetCategoryListUsecase categoryListUsecase;

  HomeControllerBase(
    this.categoryListUsecase,
  );

  @observable
  bool loading = false;

  @observable
  List<CategoryEntity> listCategories = [];

  @observable
  Option<Failure> categoryListFailure = none();

  List<dynamic> futureValues = [];

  @action
  getDados() async {
    loading = true;
    categoryListFailure = none();

    futureValues = await Future.wait([
      categoryListUsecase(NoParams()),
    ]);
    getCategoryList();

    loading = false;
  }

  void getCategoryList() {
    futureValues[0].fold((failureResult) {
      debugPrint("Deu ruim");
      categoryListFailure = optionOf(failureResult);
    }, (list) {
      listCategories.clear();
      listCategories = list;
    });
  }
}
