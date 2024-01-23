import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/font_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/values_manager.dart';

class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: FontConstants.fontFamily,
      primaryColor: ColorManager.blue,
      colorScheme: ColorScheme.light(secondary:  ColorManager.blue),
      scaffoldBackgroundColor: ColorManager.white,
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        elevation: 0,
      ),
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: getBoldStyle(color: ColorManager.blackText, fontSize: FontSize.s35),
        headlineLarge: getBoldStyle(color: ColorManager.blackText, fontSize: FontSize.s20),
        headlineMedium: getMediumStyle(color: ColorManager.blackText, fontSize: FontSize.s20),
        headlineSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s18),
        titleLarge:getBoldStyle(color: ColorManager.white, fontSize: FontSize.s18),
        titleMedium: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s16),
        titleSmall: getRegularStyle(color: ColorManager.blue, fontSize: FontSize.s14),
        bodyLarge: getBoldStyle(color: ColorManager.blue, fontSize: FontSize.s15),
        bodyMedium: getMediumStyle(color: ColorManager.eyeColor, fontSize: FontSize.s14),
        bodySmall: getRegularStyle(color: ColorManager.greyText, fontSize: FontSize.s12),
        labelLarge: getLightStyle(color: ColorManager.blue, fontSize: FontSize.s20),
        labelMedium: getLightStyle(color: ColorManager.blackText,fontSize: FontSize.s16,),
        labelSmall: getRegularStyle(color: ColorManager.blue, fontSize: FontSize.s10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            getRegularStyle(color: ColorManager.hintColor, fontSize: FontSize.s12),
        labelStyle:
            getMediumStyle(color: ColorManager.greyText, fontSize: FontSize.s14),
        fillColor: ColorManager.white,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(
          AppPadding.p20.w,
          AppPadding.p10.h,
          AppPadding.p20.w,
          AppPadding.p10.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.greyText),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.eyeColor, width: AppSize.s2.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.eyeColor, width: AppSize.s2.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: ColorManager.greyText, width: AppSize.s2.w),
        ),
      ),
    );
  }
}
