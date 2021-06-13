import 'dart:convert';

import 'package:alodjinha/core/errors/exceptions.dart';
import 'package:alodjinha/core/http_client/ihttp_client.dart';
import 'package:alodjinha/features/get_banner_list/data/datasources/get_banner_list_datasource.dart';
import 'package:alodjinha/features/get_banner_list/data/datasources/iget_banner_list_datasource.dart';
import 'package:alodjinha/features/get_banner_list/data/models/banner_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/banner_model_list_mock.dart';

class HttpClientMock extends Mock implements IhttpClient {}

main() {
  late IGetBannerListDatasource datasource;
  late IhttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = GetBannerListDatasource(client);
  });

  final urlExpected = "https://alodjinha.herokuapp.com/banner";

  test('Deve chamar o método get com a URL correta', () async {
    //Arrange
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: BANNER_MODEL_LIST_MOCK, statusCode: 200));

    //Act
    await datasource.getBannerList();

    //Assert
    verify(() => client.get(urlExpected)).called(1);
  });

  test('Deve retornar com uma lista de BannerModel', () async {
    //Arrange
    when(() => client.get(any())).thenAnswer((invocation) async =>
        HttpResponse(data: BANNER_MODEL_LIST_MOCK, statusCode: 200));

    final List<BannerModel> tBannerListExpect = List<BannerModel>.from(json
        .decode(BANNER_MODEL_LIST_MOCK)["data"]
        .map((x) => BannerModel.fromJson(x)));

    //Act
    final result = await datasource.getBannerList();

    //Assert
    expect(result, tBannerListExpect);
  });

  test('Deve retornar um ServerException quando o getBannerList falhar',
      () async {
    //Arrange
    when(() => client.get(any())).thenAnswer((invocation) async =>
        HttpResponse(data: "algo errado aconteceu", statusCode: 400));

    //Act
    final result = datasource.getBannerList();

    //Assert
    expect(() => result, throwsA(ServerException()));
  });
}
