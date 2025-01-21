import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double? height;
  final double? fontSize;
  final bool withBorder;
  final bool isUnderLine;
  final bool isIcon;
  final bool isText;
  final bool isLoading;
  final bool textFirst;
  final String svgPath;
  final Color? color;
  final Color? underLineColor;
  final Color ?textColor ;
  final Color ?iconColor ;
  final Color? borderColor;
  final double? radius;
  final double? iconSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? textStyle;
  final bool isTextCenter;
  final double? textHeight;
  final Widget? verticalWidget;
  final Widget? child;
  final double? elevation;


  const DefaultButtonWidget(
      {super.key,
        required this.onPressed,
        this.text = '',
        this.width = double.infinity,
        this.withBorder = false,
        this.isIcon = false,
        this.svgPath = '',
        this.color, this.isText = true,
        this.height,
        this.textColor,
        this.iconColor,
        this.radius,
        this.horizontalPadding,
        this.verticalPadding,
        this.borderColor,
        this.isUnderLine = false,
        this.fontSize,
        this.underLineColor,
        this.iconSize,
        this.textFirst = false,
        this.textStyle,
        this.isLoading = false,
        this.isTextCenter = true,
        this.textHeight,
        this.verticalWidget,
        this.child, this.elevation,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll( isIcon && !isText ? const CircleBorder() :
        !isUnderLine ? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius??10.sp),
        ) : LinearBorder.bottom(side: BorderSide(color: underLineColor??ColorManager.grey)),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: verticalPadding??10.h,horizontal: horizontalPadding??15.w)),
        overlayColor: WidgetStatePropertyAll(withBorder
            ? ColorManager.primary.withOpacity(.1)
            : ColorManager.white.withOpacity(.3)),
        minimumSize: horizontalPadding == null ? WidgetStatePropertyAll(Size(double.infinity,40.h)) : null,
        backgroundColor:
        WidgetStateProperty.all(isLoading ? ColorManager.greyBorder : color ?? Colors.transparent),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        side: withBorder
            ? WidgetStatePropertyAll(BorderSide(color: borderColor??ColorManager.lightGreen))
            : null,
        elevation: WidgetStatePropertyAll(elevation ?? 0),
      ),
      child: isLoading? SizedBox(
        height: 20.w,
          width: 20.w,
          child: const Center(child: CircularProgressIndicator(color: Colors.white,),)) : child??Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(verticalWidget != null)
            verticalWidget!,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(isIcon&&!textFirst)
                _svgIcon(),
              if(isIcon&&isText)
                SizedBox(width: 20.w,),
              if(isText)
                Flexible(
                  child: Text(
                    text,
                    textAlign: isTextCenter ? TextAlign.center : null,
                    style: textStyle??getBoldStyle(fontSize: fontSize??15.sp, color: textColor??ColorManager.primary,height: textHeight),
                  ),
                ),
              if(isIcon&&textFirst)
                SizedBox(width: 20.w,),
              if(isIcon&&textFirst)
                _svgIcon(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _svgIcon(){
    return SvgPicture.asset(
      svgPath,
      height: iconSize??22.h,
      width: iconSize??22.w,
      fit: BoxFit.fill,
      color: iconColor,
      // colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn)
    );
  }
}
