import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/home_brands_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/HomeBrands_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeBrandsRepo)
class HomeBrandsRepoImpl extends HomeBrandsRepo {
  HomeBrandsRemoteDataSource brandsRemoteDataSource;

  HomeBrandsRepoImpl({required this.brandsRemoteDataSource});

  @override
  Future<Either<Failures, BrandsResponseEntity>> getBrandsData() async {
    var either = await brandsRemoteDataSource.getBrandsData();
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
