import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButtomNavBar extends BottomNavigationBarItem {
  String IconPath;
  String title;

  CustomButtomNavBar({required this.IconPath, required this.title})
      : super(
            label: title,
            icon: ImageIcon(
              AssetImage(IconPath),
              color: MyAppColors.whiteColor,
            ),
            activeIcon: CircleAvatar(
              backgroundColor: MyAppColors.whiteColor,
              child: ImageIcon(
                AssetImage(IconPath),
                color: MyAppColors.primaryColor,
              ),
            ));
}
