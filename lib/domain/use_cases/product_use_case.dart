import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase {
  ProductsRepo productsRepo;

  ProductUseCase({required this.productsRepo});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productsRepo.getProductData();
  }
}
