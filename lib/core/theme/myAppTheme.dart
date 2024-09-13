import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppTheme {
  static ThemeData appTheme = ThemeData(
      primaryColor: MyAppColors.primaryColor,
      textTheme: TextTheme(
        titleMedium: TextStyle(
            color: MyAppColors.whiteColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500 //medium
            ),
        titleLarge: TextStyle(
            //buttons
            color: MyAppColors.primaryColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700 //semibold
            ),
        bodyLarge: TextStyle(
            color: MyAppColors.whiteColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700),
        titleSmall: TextStyle(
          color: MyAppColors.whiteColor,
          fontSize: 18.sp,
        ),
        bodySmall: TextStyle(
            color: MyAppColors.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            color: MyAppColors.primaryColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        displaySmall: TextStyle(
            color: MyAppColors.primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        displayLarge: TextStyle(
            color: MyAppColors.textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500),
        displayMedium: TextStyle(
            color: MyAppColors.primaryColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w500 //semibold
            ),
        headlineMedium: TextStyle(
          color: MyAppColors.primaryColor,
          fontSize: 18.sp,
        ),
        labelLarge: TextStyle(
            color: MyAppColors.primaryColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyAppColors.primaryColor,
        selectedItemColor: MyAppColors.whiteColor,
        type: BottomNavigationBarType.fixed,
      ));
}
