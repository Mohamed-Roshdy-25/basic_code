// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultRadioButton extends StatefulWidget {
  final Color borderColor;
  final Color fillColor;
  final double fillRadios;
  final String title;
  final TextStyle? titleStyle;
  final String iconPath;
  final Color? iconColor;
  final Widget? titleWidget;
  final void Function()? onTap;
  final void Function()? iconOnTap;
  final bool selected;
  const DefaultRadioButton({super.key, required this.borderColor, required this.fillColor, required this.fillRadios, this.title = '', this.titleStyle, this.iconPath = '', this.titleWidget, this.iconColor, this.onTap, required this.selected, this.iconOnTap});

  @override
  State<DefaultRadioButton> createState() => _DefaultRadioButtonState();
}

class _DefaultRadioButtonState extends State<DefaultRadioButton> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                border: Border.all(color: widget.borderColor),
                color: Colors.transparent,
                shape: BoxShape.circle
            ),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              crossFadeState: widget.selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                height: widget.fillRadios,
                width: widget.fillRadios,
                decoration: BoxDecoration(
                  color: widget.fillColor,
                  shape: BoxShape.circle,
                ),
              ),
              secondChild: Container(
                height: widget.fillRadios,
                width: widget.fillRadios,
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox(width: 10.w,),
          if(widget.title.isNotEmpty)
            Expanded(child: Text(widget.title,style: widget.titleStyle,)),
          if(widget.titleWidget != null)
            widget.titleWidget!,
          if(widget.iconPath.isNotEmpty)
            const Spacer(),
          if(widget.iconPath.isNotEmpty)
            InkWell(
                onTap: widget.iconOnTap,
                child: SvgPicture.asset(widget.iconPath,width: 20.w,height: 20.h,color: widget.iconColor,)),
        ],
      ),
    );
  }
}
