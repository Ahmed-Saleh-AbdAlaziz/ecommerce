import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopOfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 350.w,
          height: 50.h,
          decoration: BoxDecoration(
              border: Border.all(color: MyAppColors.primaryColor),
              borderRadius: BorderRadius.circular(30.r)),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'What do you search for ?',
              hintStyle: TextStyle(color: MyAppColors.descColor),
              prefixIcon: Icon(
                Icons.search,
                color: MyAppColors.primaryColor,
                size: 35,
              ),
            ),
            style: TextStyle(
                color: MyAppColors.primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        ImageIcon(
          AssetImage('assets/images/shoppingCarIcon.png'),
          color: MyAppColors.primaryColor,
        ),
      ],
    );
  }
}
