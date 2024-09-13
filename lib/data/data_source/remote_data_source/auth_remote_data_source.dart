import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/model/login_response_DTO.dart';
import 'package:ecommerce_app/data/model/register_respone_DTO.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponeDTO>> register(String name,
      String phone, String password, String rePassword, String email);

  Future<Either<Failures, LoginResponseDto>> login(
      String password, String email);
}
