import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/domain/entites/login_response_entity.dart';
import 'package:ecommerce_app/domain/entites/register_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String phone, String password, String rePassword, String email) async {
    var either = await authRemoteDataSource.register(
        name, phone, password, rePassword, email);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String password, String email) async {
    var either = await authRemoteDataSource.login(password, email);
    return either.fold((error) => left(error), (right) => Right(right));
  }
}
