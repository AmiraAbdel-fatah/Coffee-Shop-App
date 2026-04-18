import 'package:coffe_shop/CustomWidgets/custom_elevated_button.dart';
import 'package:coffe_shop/screens/home.dart';
import 'package:coffe_shop/utils/AppColors.dart';
import 'package:coffe_shop/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          // Background Image with Gradient Overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 0.65.sh,
              width: 1.sw,
              child: Image.asset(
                  "assets/images/onboarding.png", fit: BoxFit.cover),
            ),
          ),
          // Gradient for smooth transition
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.blackColor.withOpacity(0.5),
                  AppColors.blackColor,
                  AppColors.blackColor,
                ],
                stops: const [0.4, 0.6, 0.8, 1.0],
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fall in Love with\nCoffee in Blissful\nDelight!",
                  textAlign: TextAlign.center,
                  style: AppStyles.semiBold32White.copyWith(
                    fontSize: 34.sp,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.",
                  textAlign: TextAlign.center,
                  style: AppStyles.regular14LightGrey,
                ),
                SizedBox(height: 32.h),
                CustomElevatedButton(text: "Get Started", onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }),
                SizedBox(height: 54.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
