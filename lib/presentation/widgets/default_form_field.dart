import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? svgIconPath;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final VoidCallback? onTap;
  final bool disableHelperText;

  DefaultFormField(
      {super.key,
        required this.controller,
        this.svgIconPath,
        this.keyboardType,
        this.obscureText = false,
        this.suffixIcon,
        this.hintText,
        this.enabled,
        this.onTap,
        this.disableHelperText = false});

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
        prefixIcon: svgIconPath != null
            ? Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            child: SvgPicture.asset(
              svgIconPath!,
              fit: BoxFit.fill,
            ))
            : null,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
