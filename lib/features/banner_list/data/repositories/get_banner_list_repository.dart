import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/iget_banner_list_repository.dart';
import '../datasources/iget_banner_list_datasource.dart';

class GetBannerListRepository implements IGetBannerListRepository {
  final IGetBannerListDatasource datasource;

  GetBannerListRepository(this.datasource);

  @override
  Future<Either<Failure, List<BannerEntity>>> getBannerList() async {
    try {
      final result = await datasource.getBannerList();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
