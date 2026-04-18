import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppColors.dart';

class AppStyles {
  static TextStyle semiBold32White = GoogleFonts.sora(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle semiBold16White = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle semiBold8White = GoogleFonts.sora(
    fontSize: 8,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle semiBold14Active = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFFD8D8D8),
  );
  static TextStyle semiBold14White = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle semiBold16greyActive = GoogleFonts.sora(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF242424),
  );
  static TextStyle semiBold18DarkFrey = GoogleFonts.sora(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Color(0xFF050505),
  );
  static TextStyle regular14LightGrey = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFFA2A2A2),
  );
  static TextStyle regular14Platinum = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.platinumColor,
  );
  static TextStyle regular12Platinum = GoogleFonts.sora(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.platinumColor,
  );
  static TextStyle regular14Grey = GoogleFonts.sora(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}
