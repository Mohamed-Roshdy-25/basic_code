import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';

class DefaultListTile extends StatefulWidget {
  final String iconPath;
  final String text;
  final String actionButtonText;
  final void Function()? actionButtonOnPressed;
  final void Function()? onTap;
  final TextStyle? textStyle;
  final double? actionIconSize;
  final bool withUnderLine;
  final bool withTrailing;
  final Color? tileColor;
  final bool fromNetwork;

  const DefaultListTile({super.key, required this.iconPath, required this.text, this.actionButtonText = '', this.actionButtonOnPressed, this.textStyle, this.onTap, this.actionIconSize, this.withUnderLine = false, this.withTrailing = true, this.tileColor, this.fromNetwork = false});

  @override
  State<DefaultListTile> createState() => _DefaultListTileState();
}

class _DefaultListTileState extends State<DefaultListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      tileColor: widget.tileColor,
      leading: widget.fromNetwork ? Image.network(widget.iconPath,height: 25.h,width: 25.w,errorBuilder: (context, error, stackTrace) => CircleAvatar(backgroundColor: ColorManager.lightGreen.withOpacity(.3),radius: 15.sp,),) : SvgPicture.asset(widget.iconPath,height: 25.h,width: 25.w,),
      minLeadingWidth: 5.w,
      title: Text(widget.text,style: widget.textStyle??getBoldStyle(fontSize: 18.sp, color: ColorManager.textColor,height: 2.h),),
      trailing: !widget.withTrailing ? null :
      widget.actionButtonText.isNotEmpty? TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.h),
              textStyle: TextStyle(decoration: widget.withUnderLine ? TextDecoration.underline : null),
              minimumSize: const Size(0, 0)
          ),
          onPressed: widget.actionButtonOnPressed, child: Text(widget.actionButtonText,style: getBoldStyle(fontSize: 15.sp, color: ColorManager.primary, height: 1.5.h),
      )) :
      Icon(Icons.arrow_forward_ios_outlined,color: ColorManager.textColor,size: widget.actionIconSize??20,),
    );
  }
}
