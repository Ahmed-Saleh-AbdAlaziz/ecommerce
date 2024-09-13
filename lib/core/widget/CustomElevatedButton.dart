import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final Color? backgroundColor;
  final double? radius;
  final void Function() onTap;
  final TextStyle? textStyle;
  final bool isStadiumBorder;

  CustomElevatedButton({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.textStyle,
    this.isStadiumBorder = true,
    this.radius,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: isStadiumBorder
                ? StadiumBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 15.r),
                  ),
            backgroundColor: backgroundColor ?? MyAppColors.whiteColor,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            textStyle: textStyle ?? Theme.of(context).textTheme.titleLarge),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            SizedBox(width: 10.w),
            Text(label),
            if (suffixIcon != null) ...[
              SizedBox(width: 10.w),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
