import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/AppColors.dart';
import '../utils/AppStyles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final IconData? icon;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text, style: AppStyles.semiBold16White)],
        ),
      ),
    );
  }
}
