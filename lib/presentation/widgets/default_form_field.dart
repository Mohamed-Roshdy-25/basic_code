import 'dart:ui' as ui;

import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/strings_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final bool disableHelperText;
  final bool? inLeft;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool withInputFormatter;
  final bool withValidate;
  final bool withOnTapOutSide;
  final bool isUnderLine;
  final double? borderRadius;
  final String? prefixIconPath;
  final Color? borderColor;


  const DefaultFormField(
      {super.key,
        required this.controller,
        this.keyboardType,
        this.obscureText = false,
        this.suffixIcon,
        this.hintText,
        this.enabled,
        this.onTap,
        this.disableHelperText = false,
        this.errorText,
        this.onChanged,
        this.inLeft,
        this.maxLength,
        this.focusNode,
        this.autofocus = false,
        this.withInputFormatter = false,
        this.withValidate = true,
        this.withOnTapOutSide = false,
        this.borderRadius,
        this.prefixIconPath,
        this.isUnderLine = false,
        this.borderColor,
      });

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    return TextFormField(
      focusNode: withOnTapOutSide ? focusNode : null,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      onTap: onTap,
      enabled: enabled,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      textDirection: inLeft??false ? ui.TextDirection.ltr : ui.TextDirection.rtl,
      inputFormatters: withInputFormatter
          ? [
        LengthLimitingTextInputFormatter(maxLength),
        FilteringTextInputFormatter.digitsOnly
      ]
          : null,
      // cursorHeight: 25.h,
      style: getBoldStyle(
          fontSize: 15.sp, color: ColorManager.grey),
      validator: withValidate ? (value) {
        if (value?.isEmpty??false) {
          return errorText??AppStrings.textFieldError.tr();
          return '';
        }
        return null;
      } : null,
      obscureText: obscureText,
      selectionHeightStyle: ui.BoxHeightStyle.includeLineSpacingMiddle,
      onTapOutside: withOnTapOutSide ? (event) => focusNode.unfocus() : null,
      decoration: InputDecoration(
        helperText: disableHelperText ? null : '',
        prefixIcon: prefixIconPath != null
            ? Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: SvgPicture.asset(
              prefixIconPath??'',
              fit: BoxFit.fill,
            ))
            : null,
        suffixIcon: suffixIcon,
        hintText: hintText,
        focusedBorder: isUnderLine ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor??ColorManager.primary),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        enabledBorder: isUnderLine ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor??ColorManager.primary),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        errorBorder: isUnderLine ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor??ColorManager.red),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        focusedErrorBorder: isUnderLine ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor??ColorManager.red),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        disabledBorder: isUnderLine ? UnderlineInputBorder(borderSide: BorderSide(color: borderColor??ColorManager.grey),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.r),
          borderSide: BorderSide(color: ColorManager.grey, width: 2.w),
        ),
      ),
    );
  }
}
