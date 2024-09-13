import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manger.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/data/model/product_response_DTO.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/end_point.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDataSource)
class ProductsRemoteDataSourceImpl extends ProductRemoteDataSource {
  ApiManger apiManger;

  ProductsRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProductData() async {
    try {
      var response = await apiManger.getData(EndPoint.productUrl);
      var productResponse = ProductResponseDto.fromJson(response.data);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message!));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
