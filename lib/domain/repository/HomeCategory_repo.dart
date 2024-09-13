import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';

abstract class HomeCategoryRepo {
  Future<Either<Failures, CategoryResponseEntity>> getCategoryData();
}
