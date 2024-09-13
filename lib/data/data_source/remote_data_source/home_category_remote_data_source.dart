import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/model/category_response_DTO.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class HomeCategoryRemoteDataSource {
  Future<Either<Failures, CategoryResponseDto>> getCategoryData();
}
