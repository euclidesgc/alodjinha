import 'package:alodjinha/core/errors/exceptions.dart';
import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/features/category_list/data/datasources/iget_category_list_datasource.dart';
import 'package:alodjinha/features/category_list/data/models/category_model.dart';
import 'package:alodjinha/features/category_list/data/repositories/get_category_list_repository.dart';
import 'package:alodjinha/features/category_list/domain/repositories/iget_category_list_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Deve retornar um BannerListModel quando chamar o datasouce
// Deve retornar um ServerFailure quando chamar o datasouce e não repsonder corretamente'

class CategoryListDatasourceMock extends Mock
    implements IGetCategoryListDatasource {}

main() {
  late IGetCategoryListRepository repository;
  late IGetCategoryListDatasource datasource;

  setUp(() {
    datasource = CategoryListDatasourceMock();
    repository = GetCategoryListRepository(datasource);
  });

  final List<CategoryModel> tCategoryModelList = [
    CategoryModel(
        id: 1,
        descricao: "Games",
        urlImagem:
            "http://39ahd9aq5l9101brf3b8dq58.wpengine.netdna-cdn.com/wp-content/uploads/2013/06/3D-Gaming.png"),
    CategoryModel(
        id: 2,
        descricao: "Livros",
        urlImagem:
            "http://4.bp.blogspot.com/-6Bta1H9d22g/UJAIJbqcHhI/AAAAAAAAKi4/hvgjWrlFc64/s1600/resenha-missiologia.png"),
    CategoryModel(
        id: 3,
        descricao: "Celulares",
        urlImagem:
            "http://pt.seaicons.com/wp-content/uploads/2015/11/Mobile-Smartphone-icon.png"),
    CategoryModel(
        id: 4,
        descricao: "Informática",
        urlImagem:
            "http://portal.ifrn.edu.br/campus/ceara-mirim/noticias/ifrn-oferece-curso-de-informatica-basica-para-pais-dos-estudantes/image_preview"),
    CategoryModel(
        id: 5,
        descricao: "Eletrodoméstico",
        urlImagem:
            "http://classificados.folharegiao.com.br/files/classificados_categoria/photo/8/sm_4d5ed3beb0f31b61cb9a01e46ecd0cf9.png"),
    CategoryModel(
        id: 6,
        descricao: "TVs",
        urlImagem: "http://i.utdstc.com/icons/256/terrarium-tv-android.png"),
    CategoryModel(
        id: 7,
        descricao: "Filmes e Séries",
        urlImagem:
            "https://pbs.twimg.com/profile_images/801033586438733824/91Y_N91t_reasonably_small.jpg"),
    CategoryModel(
        id: 8,
        descricao: "Móveis e Decorações",
        urlImagem: "https://image.flaticon.com/icons/png/128/148/148188.png"),
    CategoryModel(
        id: 9,
        descricao: "Moda, Beleza e Perfumaria",
        urlImagem:
            "http://icon-icons.com/icons2/196/PNG/128/fashion_23852.png"),
    CategoryModel(
        id: 10,
        descricao: "Papelaria",
        urlImagem: "http://esen.pt/in/images/stories/skills_256.png")
  ];

  test(
      'Deve retornar uma lista de CategoryModel quando o datasource for chamado',
      () async {
    //Arrange
    when(() => datasource.getCategoryList())
        .thenAnswer((_) async => tCategoryModelList);
    //Act
    final result = await repository.getCategoryList();

    //Assert
    expect(result, Right(tCategoryModelList));
    verify(() => datasource.getCategoryList()).called(1);
  });

  test(
      'Deve retornar um ServerFailure quando o datasource for chamado e não responder corretamente',
      () async {
    //Arrange
    when(() => datasource.getCategoryList()).thenThrow(ServerException());

    //Act
    final result = await repository.getCategoryList();

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getCategoryList()).called(1);
  });
}
