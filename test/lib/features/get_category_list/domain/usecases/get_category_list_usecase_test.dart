import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/get_category_list/domain/entities/category_entity.dart';
import 'package:alodjinha/features/get_category_list/domain/repositories/iget_category_list_respository.dart';
import 'package:alodjinha/features/get_category_list/domain/usecases/get_category_list_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCategoryListRepositoryMock extends Mock
    implements IGetCategoryListRepository {}

main() {
  late IGetCategoryListRepository repository;
  late GetCategoryListUsecase usecase;

  setUp(() {
    repository = GetCategoryListRepositoryMock();
    usecase = GetCategoryListUsecase(repository);
  });

  final List<CategoryEntity> tCategoryEntityList = [
    CategoryEntity(
        id: 1,
        descricao: "Games",
        urlImagem:
            "http://39ahd9aq5l9101brf3b8dq58.wpengine.netdna-cdn.com/wp-content/uploads/2013/06/3D-Gaming.png"),
    CategoryEntity(
        id: 2,
        descricao: "Livros",
        urlImagem:
            "http://4.bp.blogspot.com/-6Bta1H9d22g/UJAIJbqcHhI/AAAAAAAAKi4/hvgjWrlFc64/s1600/resenha-missiologia.png"),
    CategoryEntity(
        id: 3,
        descricao: "Celulares",
        urlImagem:
            "http://pt.seaicons.com/wp-content/uploads/2015/11/Mobile-Smartphone-icon.png"),
    CategoryEntity(
        id: 4,
        descricao: "Informática",
        urlImagem:
            "http://portal.ifrn.edu.br/campus/ceara-mirim/noticias/ifrn-oferece-curso-de-informatica-basica-para-pais-dos-estudantes/image_preview"),
    CategoryEntity(
        id: 5,
        descricao: "Eletrodoméstico",
        urlImagem:
            "http://classificados.folharegiao.com.br/files/classificados_categoria/photo/8/sm_4d5ed3beb0f31b61cb9a01e46ecd0cf9.png"),
    CategoryEntity(
        id: 6,
        descricao: "TVs",
        urlImagem: "http://i.utdstc.com/icons/256/terrarium-tv-android.png"),
    CategoryEntity(
        id: 7,
        descricao: "Filmes e Séries",
        urlImagem:
            "https://pbs.twimg.com/profile_images/801033586438733824/91Y_N91t_reasonably_small.jpg"),
    CategoryEntity(
        id: 8,
        descricao: "Móveis e Decorações",
        urlImagem: "https://image.flaticon.com/icons/png/128/148/148188.png"),
    CategoryEntity(
        id: 9,
        descricao: "Moda, Beleza e Perfumaria",
        urlImagem:
            "http://icon-icons.com/icons2/196/PNG/128/fashion_23852.png"),
    CategoryEntity(
        id: 10,
        descricao: "Papelaria",
        urlImagem: "http://esen.pt/in/images/stories/skills_256.png"),
  ];

  test('Deve retornar uma lista de CategoryEntity do repositório', () async {
    //Arrange
    when(() => repository.getCategoryList()).thenAnswer(
        (_) async => Right<Failure, List<CategoryEntity>>(tCategoryEntityList));

    //Act
    final result = await usecase(NoParams());

    //Assert

    expect(result, Right(tCategoryEntityList));
    verify(() => repository.getCategoryList()).called(1);
  });

  test("Deve retornar um ServerFailure caso algo de errado na consulta",
      () async {
    //Arrange
    when(() => repository.getCategoryList()).thenAnswer(
        (_) async => Left<Failure, List<CategoryEntity>>(ServerFailure()));
    //Act
    final result = await usecase(NoParams());
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getCategoryList()).called(1);
  });
}
