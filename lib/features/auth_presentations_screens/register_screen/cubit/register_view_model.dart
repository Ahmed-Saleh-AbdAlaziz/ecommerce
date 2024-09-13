import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/register_screen/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitState());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        fullNameController.text,
        mobileNumberController.text,
        passwordController.text,
        rePasswordController.text,
        emailController.text);
    either.fold((l) => Left(emit(RegisterErrorState(failures: l))),
        (r) => Right(emit(RegisterSuccessState(registerResponseEntity: r))));
  }
}
