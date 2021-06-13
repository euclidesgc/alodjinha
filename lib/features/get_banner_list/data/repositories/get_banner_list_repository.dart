import 'package:alodjinha/core/errors/exceptions.dart';
import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/features/get_banner_list/data/datasources/iget_banner_list_datasource.dart';
import 'package:alodjinha/features/get_banner_list/domain/entities/banner_entity.dart';
import 'package:alodjinha/features/get_banner_list/domain/repositores/iget_banner_list_repository.dart';
import 'package:dartz/dartz.dart';

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
