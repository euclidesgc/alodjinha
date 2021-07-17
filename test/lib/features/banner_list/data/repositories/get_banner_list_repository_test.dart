import 'package:alodjinha/core/errors/exceptions.dart';
import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/features/banner_list/data/datasources/iget_banner_list_datasource.dart';
import 'package:alodjinha/features/banner_list/data/models/banner_model.dart';
import 'package:alodjinha/features/banner_list/data/repositories/get_banner_list_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBannerListDatasource extends Mock
    implements IGetBannerListDatasource {}

void main() {
  late GetBannerListRepository repository;
  late IGetBannerListDatasource datasource;

  setUp(() {
    datasource = MockGetBannerListDatasource();
    repository = GetBannerListRepository(datasource);
  });

  final tBannerModelList = [
    BannerModel(
      id: 1,
      linkUrl: "www.linkurl1.com",
      urlImagem: "www.urlImagem1.com",
    ),
    BannerModel(
      id: 2,
      linkUrl: "www.linkurl2.com",
      urlImagem: "www.urlImagem2.com",
    ),
  ];

  test('Deve retornar um BannerListModel quando chamar o datasouce', () async {
    //Arrange
    when(() => datasource.getBannerList())
        .thenAnswer((_) async => tBannerModelList);

    //Act
    final result = await repository.getBannerList();

    //Assert
    expect(result, Right(tBannerModelList));
    verify(() => datasource.getBannerList()).called(1);
  });

  test(
      'Deve retornar um ServerFailure quando chamar o datasouce e não repsonder corretamente',
      () async {
    //Arrange
    when(() => datasource.getBannerList()).thenThrow(ServerException());

    //Act
    final result = await repository.getBannerList();

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getBannerList()).called(1);
  });
}
