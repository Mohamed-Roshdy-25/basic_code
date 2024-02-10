import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/font_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: FontConstants.fontFamily,
      colorScheme: ColorScheme.light(secondary: ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        elevation: 0,
      ),
      brightness: Brightness.light,
      // textTheme: TextTheme(
      //   displayLarge: getBoldStyle(color: ColorManager.blackText, fontSize: FontSize.s35),
      //   headlineLarge: getBoldStyle(color: ColorManager.blackText, fontSize: FontSize.s20),
      //   headlineMedium: getMediumStyle(color: ColorManager.blackText, fontSize: FontSize.s20),
      //   headlineSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s18),
      //   titleLarge:getBoldStyle(color: ColorManager.white, fontSize: FontSize.s18),
      //   titleMedium: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s16),
      //   titleSmall: getRegularStyle(color: ColorManager.blue, fontSize: FontSize.s14),
      //   bodyLarge: getBoldStyle(color: ColorManager.blue, fontSize: FontSize.s15),
      //   bodyMedium: getMediumStyle(color: ColorManager.eyeColor, fontSize: FontSize.s14),
      //   bodySmall: getRegularStyle(color: ColorManager.greyText, fontSize: FontSize.s12),
      //   labelLarge: getLightStyle(color: ColorManager.blue, fontSize: FontSize.s20),
      //   labelMedium: getLightStyle(color: ColorManager.blackText,fontSize: FontSize.s16,),
      //   labelSmall: getRegularStyle(color: ColorManager.blue, fontSize: FontSize.s10),
      // ),
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
