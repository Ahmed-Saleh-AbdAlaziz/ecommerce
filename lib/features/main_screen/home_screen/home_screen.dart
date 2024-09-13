import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/cubit/home_tab_state.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/AdsWidget.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/CustomBrandsWidget.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/CustomCategoryWidget.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/topOfPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      bloc: HomeTabViewModel.get(context)
        ..getCategoryDate()
        ..getBrandsData(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopOfPage(),
                SizedBox(height: 15.h),
                SizedBox(height: 200.h, child: AdsWidget()),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleLarge),
                    ),
                    Text(
                      'view all',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                state is HomeTabLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyAppColors.primaryColor,
                        ),
                      )
                    : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var categoryList =
                                HomeTabViewModel.get(context).categoryList;
                            if (categoryList != null &&
                                categoryList.isNotEmpty) {
                              return CustomCategoryWidget(
                                  dataEntity: categoryList[index]);
                            } else {
                              return Center(
                                  child: Text('No Categories Available'));
                            }
                          },
                          itemCount: HomeTabViewModel.get(context)
                                  .categoryList
                                  ?.length ??
                              0,
                        ),
                      ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Brands',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleLarge),
                    ),
                    Text(
                      'view all',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                state is HomeTabLoadingBrandsState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyAppColors.primaryColor,
                        ),
                      )
                    : SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var brandList =
                                  HomeTabViewModel.get(context).brandsList;
                              if (brandList != null && brandList.isNotEmpty) {
                                return CustomBrandsWidget(
                                    dataEntity: brandList[index]);
                              } else {
                                return Center(
                                    child: Text('No Brands Available'));
                              }
                            },
                            itemCount: HomeTabViewModel.get(context)
                                    .brandsList
                                    ?.length ??
                                0),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
