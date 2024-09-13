import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/login_response_entity.dart';
import 'package:ecommerce_app/domain/entites/register_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String phone, String password, String rePassword, String email);

  Future<Either<Failures, LoginResponseEntity>> login(
      String password, String email);
}
