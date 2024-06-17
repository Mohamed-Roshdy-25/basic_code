import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/font_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: FontConstants.fontFamily,
      colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
        getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
        labelStyle:
        getMediumStyle(color: ColorManager.textColor, fontSize: 14.sp),
        fillColor: ColorManager.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.lightGreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.lightGreen),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.grey, width: 2.w),
        ),
      ),
    );
  }
}
