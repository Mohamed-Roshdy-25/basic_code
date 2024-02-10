
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget{
  final String text;
  final  bool? isBold ;
  const DefaultAppBar({super.key, required this.text, this.isBold});

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
