// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$loadingAtom = Atom(name: 'HomeControllerBase.loading');

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

  final _$listCategoriesAtom = Atom(name: 'HomeControllerBase.listCategories');

  @override
  List<CategoryEntity> get listCategories {
    _$listCategoriesAtom.reportRead();
    return super.listCategories;
  }

  @override
  set listCategories(List<CategoryEntity> value) {
    _$listCategoriesAtom.reportWrite(value, super.listCategories, () {
      super.listCategories = value;
    });
  }

  final _$categoryListFailureAtom =
      Atom(name: 'HomeControllerBase.categoryListFailure');

  @override
  Option<Failure> get categoryListFailure {
    _$categoryListFailureAtom.reportRead();
    return super.categoryListFailure;
  }

  @override
  set categoryListFailure(Option<Failure> value) {
    _$categoryListFailureAtom.reportWrite(value, super.categoryListFailure, () {
      super.categoryListFailure = value;
    });
  }

  final _$getDadosAsyncAction = AsyncAction('HomeControllerBase.getDados');

  @override
  Future getDados() {
    return _$getDadosAsyncAction.run(() => super.getDados());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
listCategories: ${listCategories},
categoryListFailure: ${categoryListFailure}
    ''';
  }
}
