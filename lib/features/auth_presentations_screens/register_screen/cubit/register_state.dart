import 'package:ecommerce_app/domain/entites/register_response_entity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterResponseEntity registerResponseEntity;

  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterState {
  Failures failures;

  RegisterErrorState({required this.failures});
}
