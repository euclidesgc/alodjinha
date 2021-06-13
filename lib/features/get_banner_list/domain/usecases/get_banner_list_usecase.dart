import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/get_banner_list/domain/entities/banner_entity.dart';
import 'package:alodjinha/features/get_banner_list/domain/repositores/iget_banner_list_repository.dart';
import 'package:dartz/dartz.dart';

class GetBannerListUsecase implements Usecase<List<BannerEntity>, NoParams> {
  final IGetBannerListRepository repository;

  GetBannerListUsecase(this.repository);

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
    return await repository.getBannerList();
  }
}
