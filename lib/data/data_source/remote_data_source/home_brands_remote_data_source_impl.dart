import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/home_brands_remote_data_source.dart';
import 'package:ecommerce_app/data/model/brands_response_DTO.dart';
import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeBrandsRemoteDataSource)
class HomeBrandsRemoteDataSourceImpl extends HomeBrandsRemoteDataSource {
  @override
  ApiManger apiManger;

  HomeBrandsRemoteDataSourceImpl({required this.apiManger});

  Future<Either<Failures, BrandsResponseEntity>> getBrandsData() async {
    try {
      var response = await apiManger.getData(EndPoint.brandsUrl);
      var brandsResponse = BrandsResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(brandsResponse);
      } else {
        return Left(ServerError(errorMessage: brandsResponse.message!));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
