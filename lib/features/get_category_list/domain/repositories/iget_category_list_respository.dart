import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGetCategoryListRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategoryList();
}
