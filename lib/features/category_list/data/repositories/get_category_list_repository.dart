import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/iget_category_list_respository.dart';
import '../datasources/iget_category_list_datasource.dart';

class GetCategoryListRepository implements IGetCategoryListRepository {
  final IGetCategoryListDatasource datasource;

  GetCategoryListRepository(this.datasource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList() async {
    try {
      final result = await datasource.getCategoryList();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

