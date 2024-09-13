import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsWidget extends StatefulWidget {
  @override
  State<AdsWidget> createState() => _AdsWidgetState();
  int currentIndex = 0;
}

class _AdsWidgetState extends State<AdsWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 200.h,
          autoPlay: true,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              widget.currentIndex = index;
            });
          },
        ),
        items: [
          Image.asset('assets/images/Ad1.png', fit: BoxFit.cover),
          Image.asset('assets/images/Ad2.png', fit: BoxFit.cover),
          Image.asset('assets/images/Ad3.png', fit: BoxFit.cover),
        ],
      ),
      Positioned(
        right: 170.w,
        top: 150.h,
        child: DotsIndicator(
          dotsCount: 3,
          position: widget.currentIndex,
          decorator: DotsDecorator(
            activeColor: MyAppColors.primaryColor,
            color: MyAppColors.whiteColor,
            size: Size(8.0, 8.0),
            activeSize: Size(8, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      )
    ]);
  }
}
