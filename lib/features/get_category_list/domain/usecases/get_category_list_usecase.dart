// class GetBannerListUsecase implements Usecase<List<BannerEntity>, NoParams> {
//   final IGetBannerListRepository repository;

//   GetBannerListUsecase(this.repository);

//   @override
//   Future<Either<Failure, List<BannerEntity>>> call(NoParams params) async {
//     return await repository.getBannerList();
//   }
// }

import 'package:alodjinha/core/errors/failures.dart';
import 'package:alodjinha/core/usecase/usecase.dart';
import 'package:alodjinha/features/get_category_list/domain/entities/category_entity.dart';
import 'package:alodjinha/features/get_category_list/domain/repositories/iget_category_list_respository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryListUsecase
    implements Usecase<List<CategoryEntity>, NoParams> {
  final IGetCategoryListRepository repository;

  GetCategoryListUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategoryList();
  }
}
