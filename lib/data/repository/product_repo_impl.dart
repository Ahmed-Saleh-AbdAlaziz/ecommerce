import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/products_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductRepoImpl extends ProductsRepo {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failures, ProductResponseEntity>> getProductData() async {
    var either = await productRemoteDataSource.getProductData();
    return either.fold((l) => Left(l), (r) => Right(r));
  }
}
