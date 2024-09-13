import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  String? label;
  String hintText;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();
  TextInputType keyboardType;
  bool obscureText;
  Icon? editIcon;

  CustomTextFormField(
      {required this.hintText,
      required this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.label,
      this.editIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: TextFormField(
        style: TextStyle(color: MyAppColors.primaryColor),
        decoration: InputDecoration(
            fillColor: MyAppColors.whiteColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                    BorderSide(color: MyAppColors.primaryColor, width: 2.w)),
            //lma bagy aktb byfdl nafs el design
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide:
                    BorderSide(color: MyAppColors.primaryColor, width: 2.w)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.red, width: 2.w)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.red, width: 2.w)),
            errorStyle: TextStyle(color: Colors.amber),
            label: Text(
              label ?? '',
              style: TextStyle(color: MyAppColors.whiteColor),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 18.sp,
              color: MyAppColors.greyColor,
            ),
            suffixIcon: editIcon),
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
