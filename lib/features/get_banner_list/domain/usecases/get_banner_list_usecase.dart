import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/banner_entity.dart';
import '../repositories/iget_banner_list_repository.dart';

class GetBannerListUsecase implements Usecase<List<BannerEntity>, NoParams> {
  final IGetBannerListRepository repository;

  GetBannerListUsecase(this.repository);

  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
    return await repository.getBannerList();
  }
}
