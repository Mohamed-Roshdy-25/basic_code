import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? prefixIconPath;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final VoidCallback? onTap;
  final bool disableHelperText;
  final double? borderRadius;
  final bool isUnderLine;

  DefaultFormField(
      {super.key,
        required this.controller,
        this.prefixIconPath,
        this.keyboardType,
        this.obscureText = false,
        this.suffixIcon,
        this.hintText,
        this.enabled,
        this.onTap,
        this.disableHelperText = false, this.borderRadius, this.isUnderLine = false});

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      enabled: enabled,
      focusNode: _focusNode,
      keyboardType: keyboardType,
      controller: controller,
      onTapOutside: (event) => _focusNode.unfocus(),
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: ColorManager.primary),
      validator: (value) {
        if ((value?.isEmpty)??false) {
          return AppStrings.textFieldError.tr();
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        helperText: disableHelperText ? null : '',
        prefixIcon: prefixIconPath != null
            ? Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: SvgPicture.asset(
              prefixIconPath!,
              fit: BoxFit.fill,
            ))
            : null,
        suffixIcon: suffixIcon,
        hintText: hintText,
        focusedBorder: isUnderLine ? const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.primary),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.sp),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        enabledBorder: isUnderLine ? const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.primary),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.sp),
          borderSide: const BorderSide(color: ColorManager.primary),
        ),
        errorBorder: isUnderLine ? const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.red),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.sp),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        focusedErrorBorder: isUnderLine ? const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.red),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.sp),
          borderSide: BorderSide(color: ColorManager.red, width: 2.w),
        ),
        disabledBorder: isUnderLine ? const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.grey),) : OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius??8.sp),
          borderSide: BorderSide(color: ColorManager.grey, width: 2.w),
        ),
      ),
    );
  }
}
