import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double? height;
  final bool withBorder;
  final bool isIcon;
  final bool isText;
  final String svgPath;
  final Color? color;
  final Color ?textColor ;
  final Color ?iconColor ;
  final double? radius;
  final double? horizontalPadding;
  final double? verticalPadding;
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
        this.iconColor, this.radius, this.horizontalPadding, this.verticalPadding
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius??10.sp),
          ),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: verticalPadding??10.h,horizontal: horizontalPadding??15.w)),
        overlayColor: WidgetStatePropertyAll(withBorder
            ? ColorManager.primary.withOpacity(.1)
            : ColorManager.white.withOpacity(.3)),
        minimumSize: horizontalPadding == null ? WidgetStatePropertyAll(Size(double.infinity,40.h)) : null,
        backgroundColor:
        WidgetStateProperty.all(withBorder ? Colors.transparent : color),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        side: withBorder
            ? const WidgetStatePropertyAll(BorderSide(color: ColorManager.lightGreen))
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(isIcon)
            SvgPicture.asset(
              svgPath,
              height: 22.h,
              width: 22.w,
              fit: BoxFit.fill,
              color: iconColor,
              // colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn)
            ),
          if(isIcon&&isText)
            SizedBox(width: 20.w,),
          if(isText)
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textColor !=null ?
                Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: textColor,fontSize: 14.sp)
                    :
                Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color:
                withBorder ? ColorManager.primary : null,fontSize: 14.sp),
              ),
            ),
        ],
      ),
    );
  }
}
