import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class HomeBrandsRepo {
  Future<Either<Failures, BrandsResponseEntity>> getBrandsData();
}
