import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/home_category_remote_data_source.dart';
import 'package:ecommerce_app/data/model/category_response_DTO.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeCategoryRemoteDataSource)
class HomeCategoryRemoteDataSourceImpl extends HomeCategoryRemoteDataSource {
  ApiManger apiManger;

  HomeCategoryRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failures, CategoryResponseDto>> getCategoryData() async {
    try {
      var response = await apiManger.getData(EndPoint.categoryUrl);
      var categoryResponse = CategoryResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(categoryResponse);
      } else {
        return Left(ServerError(errorMessage: categoryResponse.message!));
      }
    } catch (e) {
      return left(Failures(errorMessage: e.toString()));
    }
  }
}
