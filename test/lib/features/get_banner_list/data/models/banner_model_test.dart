import 'dart:convert';

import 'package:alodjinha/features/get_banner_list/data/models/banner_model.dart';
import 'package:alodjinha/features/get_banner_list/domain/entities/banner_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../mocks/banner_model_mock.dart';

void main() {
  final tBannerModel = BannerModel(
    id: 1,
    urlImagem:
        "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png",
    linkUrl:
        "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png",
  );

  test('BannerModel deve ser uma subclasse de BannerEntiry', () {
    expect(tBannerModel, isA<BannerEntity>());
  });

  test('Deve retornar um BannerModel válido', () {
    //Arrangee
    final Map<String, dynamic> jsonMap = json.decode(BANNER_MODEL_MOCK);

    //Act
    final result = BannerModel.fromJson(jsonMap);

    //Assert
    expect(result, tBannerModel);
  });

  test('Deve retornar um json contendo os dados apropriados', () {
    //Arrangee
    final expectedBannerMap = {
      "id": 1,
      "urlImagem":
          "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png",
      "linkUrl":
          "https://images-submarino.b2w.io/spacey/2017/02/06/MainTop_GAMES_FEV17.png",
    };

    //Act
    final result = tBannerModel.toJson();

    //Assert
    expect(result, expectedBannerMap);
  });
}
