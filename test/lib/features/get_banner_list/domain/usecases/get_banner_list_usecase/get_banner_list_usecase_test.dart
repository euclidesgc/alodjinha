import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/get_banner_list/domain/entities/banner_entity.dart';
import 'package:alodjinha/features/get_banner_list/domain/repositores/iget_banner_list_repository.dart';
import 'package:alodjinha/features/get_banner_list/domain/usecases/get_banner_list_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetBannerListRepository extends Mock
    implements IGetBannerListRepository {}

void main() {
  late GetBannerListUsecase usecase;
  late IGetBannerListRepository repository;

  setUp(() {
    repository = MockGetBannerListRepository();
    usecase = GetBannerListUsecase(repository);
  });

  final tBannerEntityList = [
    BannerEntity(
      id: 1,
      linkUrl: "www.linkurl1.com",
      urlImagem: "www.urlImagem1.com",
    ),
    BannerEntity(
      id: 2,
      linkUrl: "www.linkurl2.com",
      urlImagem: "www.urlImagem2.com",
    ),
  ];

  NoParams noParams = NoParams();
  test('Deve retornar uma lista de BannerEntity do repositório', () async {
    when(() => repository.getBannerList()).thenAnswer(
        (_) async => Right<Failure, List<BannerEntity>>(tBannerEntityList));

    final result = await usecase(noParams);

    expect(result, Right(tBannerEntityList));

    verify(() => repository.getBannerList()).called(1);
  });

  test('Deve retornar um ServerFailure caso algo de errado na consulta',
      () async {
    when(() => repository.getBannerList()).thenAnswer(
        (_) async => Left<Failure, List<BannerEntity>>(ServerFailure()));

    final result = await usecase(noParams);

    expect(result, Left(ServerFailure()));

    verify(() => repository.getBannerList()).called(1);
  });
}
