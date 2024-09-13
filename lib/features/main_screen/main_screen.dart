import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/core/widget/CustomButtomNavBar.dart';
import 'package:ecommerce_app/features/main_screen/cubit/home_screen_state.dart';
import 'package:ecommerce_app/features/main_screen/cubit/home_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  static String routeName = 'Main_Screen';

  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyAppColors.whiteColor,
          appBar: AppBar(
            title: Image.asset('assets/images/route_appBar.png'),
            backgroundColor: MyAppColors.whiteColor,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyAppColors.primaryColor),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                height: 100.h,
                child: BottomNavigationBar(
                  currentIndex: viewModel.selectedIndex,
                  onTap: (index) {
                    viewModel.changeSelectedIndex(index);
                  },
                  items: [
                    CustomButtomNavBar(
                        IconPath: 'assets/images/homeItem.png', title: ''),
                    CustomButtomNavBar(
                        IconPath: 'assets/images/categoryItem.png', title: ''),
                    CustomButtomNavBar(
                        IconPath: 'assets/images/heartItem.png', title: ''),
                    CustomButtomNavBar(
                        IconPath: 'assets/images/userItem.png', title: ''),
                  ],
                ),
              ),
            ),
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
