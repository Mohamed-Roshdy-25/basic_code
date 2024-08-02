// ignore_for_file: deprecated_member_use

import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultRadioButton extends StatefulWidget {
  final Color? borderColor;
  final Color? fillColor;
  final double? fillRadios;
  final String title;
  final TextStyle? titleStyle;
  final String iconPath;
  final Color? iconColor;
  final Color? containerBorderColor;
  final Widget? titleWidget;
  final void Function()? onTap;
  final void Function()? iconOnTap;
  final bool selected;
  final bool moveToEnd;
  final bool moveIconToStart;
  final bool withMargin;
  const DefaultRadioButton({super.key, this.borderColor, this.fillColor, this.fillRadios, this.title = '', this.titleStyle, this.iconPath = '', this.titleWidget, this.iconColor, this.onTap, required this.selected, this.iconOnTap, this.containerBorderColor, this.moveToEnd = false, this.withMargin = false, this.moveIconToStart = false});

  @override
  State<DefaultRadioButton> createState() => _DefaultRadioButtonState();
}

class _DefaultRadioButtonState extends State<DefaultRadioButton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: widget.onTap,
      child: Container(
        margin: widget.withMargin ? EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w) : null,
        padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
        decoration: BoxDecoration(
            border: widget.containerBorderColor != null ? Border.all(color: widget.containerBorderColor!) : null,
            borderRadius: BorderRadius.circular(10.sp)
        ),
        child: Row(
          children: [
            if(!widget.moveToEnd)
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(color: widget.borderColor??ColorManager.primary),
                    color: Colors.transparent,
                    shape: BoxShape.circle
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: widget.selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  firstChild: Container(
                    height: widget.fillRadios??15.h,
                    width: widget.fillRadios??15.w,
                    decoration: BoxDecoration(
                      color: widget.fillColor??ColorManager.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  secondChild: Container(
                    height: widget.fillRadios??15.h,
                    width: widget.fillRadios??15.w,
                    color: Colors.transparent,
                  ),
                ),
              ),
            if(!widget.moveToEnd)
              SizedBox(width: 10.w,),
            if(widget.iconPath.isNotEmpty && widget.moveIconToStart)
              InkWell(
                  onTap: widget.iconOnTap,
                  child: SvgPicture.asset(widget.iconPath,width: 30.w,height: 30.h,color: widget.iconColor,)),
            if(widget.iconPath.isNotEmpty && widget.moveIconToStart)
              SizedBox(width: 10.w,),
            if(widget.title.isNotEmpty)
              Expanded(child: Text(widget.title,style: widget.titleStyle,)),
            if(widget.titleWidget != null)
              widget.titleWidget!,
            // if(widget.iconPath.isNotEmpty)
            const Spacer(),
            if(widget.iconPath.isNotEmpty && !widget.moveIconToStart)
              InkWell(
                  onTap: widget.iconOnTap,
                  child: SvgPicture.asset(widget.iconPath,width: 30.w,height: 30.h,color: widget.iconColor,)),
            if(widget.moveToEnd)
              SizedBox(width: 5.w,),
            if(widget.moveToEnd)
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(color: widget.borderColor??ColorManager.primary),
                    color: Colors.transparent,
                    shape: BoxShape.circle
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: widget.selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  firstChild: Container(
                    height: widget.fillRadios??15.h,
                    width: widget.fillRadios??15.w,
                    decoration: BoxDecoration(
                      color: widget.fillColor??ColorManager.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  secondChild: Container(
                    height: widget.fillRadios??15.h,
                    width: widget.fillRadios??15.w,
                    color: Colors.transparent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
