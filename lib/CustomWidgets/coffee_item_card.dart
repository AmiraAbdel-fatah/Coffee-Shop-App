import 'package:coffe_shop/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeItemCard extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String price;
  final double rating;

  const CoffeeItemCard({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Rating Area
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    image,
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/icons/Star.png",
                        height: 10.h,
                        width: 10.w,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Text and Price Area
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Text(
                    type,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ $price",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
