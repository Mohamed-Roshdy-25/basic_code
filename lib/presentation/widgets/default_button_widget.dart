import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double width;
  final double height;
  final bool withBorder;
  final bool isIcon;
  final bool isText;
  final String svgPath;
  final Color? color;
  final Color ?textColor ;
  final Color ?iconColor ;
  const DefaultButtonWidget(
      {super.key,
      required this.onPressed,
      this.text = '',
      this.width = double.infinity,
      this.withBorder = false,
      this.isIcon = false,
      this.svgPath = '',
      this.color, this.isText = true, 
      this.height = 40,
      this.textColor,
      this.iconColor
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all(
          Size(width.w, height.h),
        ),
        overlayColor: MaterialStatePropertyAll(withBorder
            ? ColorManager.primary.withOpacity(.1)
            : ColorManager.white.withOpacity(.3)),
        backgroundColor:
            MaterialStateProperty.all(withBorder ? Colors.transparent : color),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        side: withBorder
            ? MaterialStatePropertyAll(BorderSide(color: ColorManager.lightGreen))
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
          ),
          if(isIcon&&isText)
          SizedBox(width: 20.w,),
          if(isText)
          Text(
            text,
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
        ],
      ),
    );
  }
}
