import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/brands_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/HomeBrands_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBrandsUseCase {
  HomeBrandsRepo brandsRepo;

  HomeBrandsUseCase({required this.brandsRepo});

  Future<Either<Failures, BrandsResponseEntity>> invoke() {
    return brandsRepo.getBrandsData();
  }
}
