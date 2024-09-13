import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/core/widget/dialog_utliz.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/cubit/login_state.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/cubit/login_view_model.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/widget/CustomElevatedButton.dart';
import '../../../core/widget/CustomTextFormField.dart';
import '../../../core/widget/validator.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'loginScreen';

  LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtliz.showLoading(context: context, messege: 'Loading');
        } else if (state is LoginErrorState) {
          DialogUtliz.hideLoading(context);
          DialogUtliz.showMessege(
              context: context,
              content: state.failures.errorMessage,
              ButtonOneName: 'Try again',
              ButtonOne: () {
                Navigator.pop(context);
              });
        } else if (state is LoginSuccessState) {
          DialogUtliz.hideLoading(context);
          DialogUtliz.showMessege(
              context: context,
              content: 'Login Successfully',
              ButtonOneName: 'OK',
              ButtonOne: () {
                SharedPreferencesUtils.saveData(
                    key: 'token', value: state.loginResponseEntity.token);
                Navigator.of(context)
                    .pushReplacementNamed(MainScreen.routeName);
              });
        }
      },
      bloc: viewModel,
      child: Scaffold(
        backgroundColor: MyAppColors.primaryColor,
        body: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Center(child: Image.asset('assets/images/route_logo.png')),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Welcome Back To Route',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
                Text(
                  'please sign in with your mail',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Email',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium),
                ),
                CustomTextFormField(
                    hintText: 'Enter your Email',
                    validator: (value) {
                      return AppValidator.validateEmail(value);
                    },
                    controller: viewModel.emailController),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium),
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  validator: (value) {
                    AppValidator.validatePassword(value);
                  },
                  controller: viewModel.passwordController,
                  obscureText: true,
                ),
                InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forget password?',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomElevatedButton(
                  label: 'Login',
                  onTap: () {
                    viewModel.login();
                  },
                  isStadiumBorder: false,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have account?',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleSmall),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleSmall),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
