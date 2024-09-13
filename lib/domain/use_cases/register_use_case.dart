import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entites/register_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String phone, String password, String rePassword, String email) {
    return authRepository.register(name, phone, password, rePassword, email);
  }
}
