// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_code_for_any_project/presentation/resources/assets_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';

class DefaultExpansionTile extends StatefulWidget {
  final String name;
  final String image;
  final List options;
  final void Function()? onTap;

  const DefaultExpansionTile({super.key, required this.name, required this.image, required this.options, this.onTap});

  @override
  State<DefaultExpansionTile> createState() => _DefaultExpansionTileState();
}

class _DefaultExpansionTileState extends State<DefaultExpansionTile> {
  bool isOpen = false;
  int? isSelected;
  String lastChoice = '';


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ExpansionTile(
        // tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp)
        ),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp)
        ),
        backgroundColor: ColorManager.white,
        collapsedBackgroundColor: ColorManager.white,
        iconColor: ColorManager.black,
        collapsedIconColor: ColorManager.black,
        onExpansionChanged: (value) {
          setState(() {
            isOpen = value;
          });
        },
        leading: _leading(),
        title: _title(),
        children: options(context),
      ),
    );
  }

  Widget _leading() {
    return Image.network(widget.image,width: 30.w,height: 30.w,errorBuilder: (context, error, stackTrace) => SizedBox(width: 30.w,height: 30.w,),);
  }

  Widget _title(){
    return Text(
      widget.name,
      style: getBoldStyle(fontSize: 15.sp, color: ColorManager.black,),
    );
  }

  trailingIcon(){
    return SvgPicture.asset(isOpen ? IconAssets.splashImage : IconAssets.splashImage,color: ColorManager.primary,height: 15.h,width: 15.w,);
  }

  options(BuildContext context) => List.generate(
    widget.options.length,
        (index) {
      return InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey.withOpacity(.5)),
          ),
          child: Text(widget.options[index],style: getBoldStyle(fontSize: 15.sp, color: ColorManager.textColor),),
        ),
      );
    },
  );
}
