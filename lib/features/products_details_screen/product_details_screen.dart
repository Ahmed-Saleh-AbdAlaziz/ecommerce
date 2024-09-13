import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatefulWidget {
  static String routeName = 'details_screen';
  int currentIndex = 0;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var product =
        ModalRoute.of(context)!.settings.arguments as ProductDataEntity;
    var images = product.images ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Product Details',
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
            size: 35.h,
            color: MyAppColors.primaryColor,
          ),
          SizedBox(width: 20.w),
          ImageIcon(
            AssetImage('assets/images/shoppingCarIcon.png'),
            color: MyAppColors.primaryColor,
            size: 35.h,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400.h,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            widget.currentIndex = index;
                          });
                        },
                      ),
                      items: images.map((imageUrl) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: MyAppColors.strokeColor,
                              width: 2.0, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.grey,
                                    size: 50.h,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 10.h,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: images.length,
                        position: widget.currentIndex,
                        decorator: DotsDecorator(
                          activeColor: MyAppColors.primaryColor,
                          color: MyAppColors.whiteColor,
                          size: Size(8.0, 8.0),
                          activeSize: Size(8.0, 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          spacing: EdgeInsets.all(4.0),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20.w,
                      top: 10.h,
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        color: MyAppColors.primaryColor,
                        size: 45.h,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      product.title ?? '',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      maxLines: 4,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 145.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: MyAppColors.primaryColor)),
                    child: Center(
                      child: Text(
                        'EGP ${product.price}',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: MyAppColors.strokeColor)),
                    child: Center(
                      child: Text(
                        '${product.sold} Sold',
                        style: GoogleFonts.poppins(
                            textStyle:
                                Theme.of(context).textTheme.displayMedium),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35.w,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 30.h,
                  ),
                  Text('${product.ratingsAverage} (${product.ratingsQuantity})',
                      style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.displayMedium)),
                  SizedBox(
                    width: 60.w,
                  ),
                  Container(
                    width: 120.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: MyAppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            )),
                        Text('1',
                            style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.titleLarge),
              ),
              SizedBox(
                height: 15.h,
              ),
              ReadMoreText(
                product.description ?? '',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                trimExpandedText: 'Read Less',
                trimCollapsedText: 'Read More',
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: MyAppColors.primaryColor,
                lessStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                moreStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: MyAppColors.primaryColor,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        child: Text(
                          'EGP ${product.price}',
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: MyAppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Container(
                    color: Colors.transparent,
                    width: 250.w,
                    height: 50.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyAppColors.primaryColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            ImageIcon(
                              AssetImage('assets/images/cart.png'),
                              color: Colors.white,
                              size: 25.w,
                            ),
                            SizedBox(
                              width: 35.w,
                            ),
                            Text(
                              'Add to cart',
                              style: GoogleFonts.poppins(
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
