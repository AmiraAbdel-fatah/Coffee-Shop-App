import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Map Background
          Positioned.fill(
            child: Image.asset("assets/images/Maps.png", fit: BoxFit.cover),
          ),

          // 2. Route Line
          Positioned(
            top: 110.h,
            left: 80.w,
            right: 120.w,
            child: SizedBox(
              height: 300,
              width: 100,
              child: Image.asset(
                "assets/images/Rute (1).png",
                // fit: BoxFit.contain,
              ),
            ),
          ),

          // 3. Destination Pin (Delivery Info)
          Positioned(
            top: 290.h,
            left: 80.w,
            child: Image.asset("assets/images/Delivery Info.png", width: 36.w),
          ),

          // 4. Bike Marker (Delivery Location)
          Positioned(
            top: 215.h,
            right: 290.w,
            child: Image.asset(
              "assets/images/Delivery Location.png",
              width: 50.w,
            ),
          ),
          Positioned(
            top: 320.h,
            right: 100.w,
            child: Image.asset("assets/images/Driver.png", width: 50.w),
          ),

          // 5. Floating Top Buttons
          Positioned(
            top: 60.h,
            left: 30.w,
            right: 30.w,
            child: Image.asset("assets/images/Delivery Info.png"),
          ),

          // 6. Bottom Delivery Info Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 44.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAEAEA),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "10 minutes left",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2F2D2C),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF9B9B9B),
                      ),
                      children: [
                        const TextSpan(text: "Delivery to "),
                        TextSpan(
                          text: "Jl. Kpg Sutoyo",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Progress Bars
                  Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Container(
                          height: 4.h,
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            color: index < 3
                                ? const Color(0xFF36C07E)
                                : const Color(0xFFDFDFDF),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  // Delivery Status Card
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEAEAEA)),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Image.asset(
                            "assets/icons/bike.png",
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivered your order",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2F2D2C),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                "We will deliver your goods to you in the shortest possible time.",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF9B9B9B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Courier Info
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.asset(
                          "assets/images/profile.png",
                          width: 54.w,
                          height: 54.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Brooklyn Simmons",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF2F2D2C),
                              ),
                            ),
                            Text(
                              "Personal Courier",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF9B9B9B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFEAEAEA)),
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Image.asset(
                          "assets/icons/Calling.png",
                          height: 24.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton(
    BuildContext context,
    String iconPath, {
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Image.asset(iconPath, height: 24.h, width: 24.w),
      ),
    );
  }
}
