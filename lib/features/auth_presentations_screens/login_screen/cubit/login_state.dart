import 'package:ecommerce_app/domain/entites/login_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginState {
  Failures failures;

  LoginErrorState({required this.failures});
}
