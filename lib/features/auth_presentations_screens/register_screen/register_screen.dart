import 'dart:typed_data';

import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/core/widget/CustomElevatedButton.dart';
import 'package:ecommerce_app/core/widget/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widget/dialog_utliz.dart';
import 'package:ecommerce_app/core/widget/validator.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/login_screen.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/register_screen/cubit/register_state.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/register_screen/cubit/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = 'registerScreen';
  RegisterViewModel viewModel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtliz.showLoading(context: context, messege: 'Loading');
        } else if (state is RegisterErrorState) {
          DialogUtliz.hideLoading(context);
          DialogUtliz.showMessege(
            context: context,
            content: state.failures.errorMessage,
            ButtonOneName: 'Try again',
            ButtonOne: () {
              Navigator.pop(context);
            },
          );
        } else if (state is RegisterSuccessState) {
          DialogUtliz.hideLoading(context);
          DialogUtliz.showMessege(
            context: context,
            content: 'Register Successfully',
            ButtonOneName: 'OK',
            ButtonOne: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: MyAppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80.h),
                  Center(child: Image.asset('assets/images/route_logo.png')),
                  SizedBox(height: 80.h),
                  Text(
                    'Full Name',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Full Name',
                    validator: (value) {
                      return AppValidator.validateFullName(value);
                    },
                    controller: viewModel.fullNameController,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Mobile Number',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Mobile Number',
                    validator: (value) {
                      return AppValidator.validatePhoneNumber(value);
                    },
                    controller: viewModel.mobileNumberController,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'E-mail address',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'E-mail address',
                    validator: (value) {
                      return AppValidator.validateEmail(value);
                    },
                    controller: viewModel.emailController,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Password',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    validator: (value) {
                      return AppValidator.validatePassword(value);
                    },
                    controller: viewModel.passwordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Confirm Password',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomTextFormField(
                    hintText: 'Confirm Password',
                    validator: (value) {
                      return AppValidator.validateConfirmPassword(
                          value, viewModel.passwordController.text);
                    },
                    controller: viewModel.rePasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 30.h),
                  Builder(
                    builder: (context) {
                      return CustomElevatedButton(
                        label: 'Sign Up',
                        onTap: () {
                          final form = Form.of(context);
                          if (form != null && form.validate()) {
                            viewModel.register();
                          }
                        },
                        isStadiumBorder: false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
