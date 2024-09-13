import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        passwordController.text, emailController.text);
    either.fold((l) => Left(emit(LoginErrorState(failures: l))),
        (r) => Right(emit(LoginSuccessState(loginResponseEntity: r))));
  }
}
