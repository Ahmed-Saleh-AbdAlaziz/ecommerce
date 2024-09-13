import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/HomeCategory_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCategoryUseCase {
  HomeCategoryRepo homeCategoryRepo;

  HomeCategoryUseCase({required this.homeCategoryRepo});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return homeCategoryRepo.getCategoryData();
  }
}
