import '../../../../core/errors/failures.dart';
import '../entities/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetBannerListRepository {
  Future<Either<Failure, List<BannerEntity>>> getBannerList();
}
