import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/features/get_banner_list/domain/entities/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetBannerListRepository {
  Future<Either<Failure, List<BannerEntity>>> getBannerList();
}
