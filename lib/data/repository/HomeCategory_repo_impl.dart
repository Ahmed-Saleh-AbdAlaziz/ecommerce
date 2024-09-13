import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/home_category_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/HomeCategory_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeCategoryRepo)
class HomeCategoryRepoImpl extends HomeCategoryRepo {
  HomeCategoryRemoteDataSource categoryRemoteDataSource;

  HomeCategoryRepoImpl({required this.categoryRemoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getCategoryData() async {
    var either = await categoryRemoteDataSource.getCategoryData();
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
