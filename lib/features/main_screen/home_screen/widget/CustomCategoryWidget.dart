import 'package:ecommerce_app/domain/entites/category_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCategoryWidget extends StatelessWidget {
  final CategoryDataEntity dataEntity;

  CustomCategoryWidget({required this.dataEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.network(
                dataEntity.image ?? '',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: Colors.grey,
                    size: 50.h,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            dataEntity.name ?? '',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.bodyMedium),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
