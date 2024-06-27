import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:basic_code_for_any_project/presentation/resources/assets_manager.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultDropdownMenuWidget extends StatefulWidget {
  final void Function(dynamic) onSelected;
  final String? leadingIcon;
  final List items;
  final String hintText;
  final bool enabled;
  final bool withSuffixIcon;
  final double? width;
  final Color? fillColor;
  final TextEditingController? controller;
  final Widget? label;
  final dynamic selectedValue;
  const DefaultDropdownMenuWidget(
      {super.key,
      required this.onSelected,
      this.leadingIcon,
      required this.items,
      required this.hintText,
      this.enabled = true,
      this.controller,
      this.width = 300,
      this.fillColor,
      this.withSuffixIcon = true,
      this.label,
      required this.selectedValue});

  @override
  State<DefaultDropdownMenuWidget> createState() =>
      _DefaultDropdownMenuWidgetState();
}

class _DefaultDropdownMenuWidgetState extends State<DefaultDropdownMenuWidget> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.enabled
        ? Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                // leadingIcon: widget.leadingIcon != null
                //     ? Padding(
                //         padding: EdgeInsets.only(right: 10.w),
                //         child: SvgPicture.asset(
                //           widget.leadingIcon!,
                //           height: 20.h,
                //           width: 20.w,
                //           fit: BoxFit.fill,
                //         ),
                //       )
                //     : null,
                iconStyleData: IconStyleData(
                  icon: widget.withSuffixIcon
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: SvgPicture.asset(
                            ImageAssets.logo,
                            fit: BoxFit.fill,
                          ),
                        )
                      : const Text(''),
                ),
                isExpanded: true,
                hint: Text(
                  widget.hintText,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ColorManager.grey),
                ),
                items: widget.items
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: ColorManager.primary),
                          ),
                        ))
                    .toList(),
                value: widget.selectedValue,
                onChanged: widget.onSelected,
                buttonStyleData: ButtonStyleData(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                  width: widget.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: widget.fillColor,
                      border: const Border.symmetric(
                        vertical: BorderSide(
                          color: ColorManager.grey,
                        ),
                        horizontal: BorderSide(color: ColorManager.grey),
                      )),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h,
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40.h,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50.h,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 4.h,
                      right: 8.w,
                      left: 8.w,
                    ),
                    child: TextFormField(
                      focusNode: _focusNode,
                      expands: true,
                      maxLines: null,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ColorManager.primary),
                      controller: textEditingController,
                      onTapOutside: (event) => _focusNode.unfocus(),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: TextStyle(fontSize: 12.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return (item.value as dynamic)
                        .name
                        .toString()
                        .toLowerCase()
                        .contains(searchValue);
                  },
                ),

                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    textEditingController.clear();
                  }
                },
              ),
            ),
          )
        : DropdownMenu(
            controller: widget.controller,
            textStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ColorManager.primary),
            onSelected: widget.onSelected,
            width: widget.width,
            enabled: widget.enabled,
            hintText: widget.hintText,
            label: widget.label,
            menuHeight: 200.h,
            leadingIcon: widget.leadingIcon == null
                ? null
                : Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                    child: SvgPicture.asset(
                      widget.leadingIcon!,
                      fit: BoxFit.fill,
                    )),
            trailingIcon: widget.withSuffixIcon
                ? Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                    child: SvgPicture.asset(
                      ImageAssets.logo,
                      fit: BoxFit.fill,
                    ))
                : const Text(''),
            dropdownMenuEntries: widget.items
                .map((e) => DropdownMenuEntry(value: e.id, label: e.name))
                .toList(),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: widget.fillColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: const BorderSide(color: ColorManager.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.sp),
                borderSide: const BorderSide(color: ColorManager.grey),
              ),
            ),
          );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return DropdownMenu(
  //       controller: widget.controller,
  //       textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManager.blue),
  //       onSelected: widget.onSelected,
  //       width: widget.width.w,
  //       enabled: widget.enabled,
  //       hintText: widget.hintText,
  //       label: widget.label,
  //       menuHeight: 200.h,
  //       leadingIcon: widget.leadingIcon == null ? null :  Container(
  //           padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
  //           child: SvgPicture.asset(
  //             widget.leadingIcon!,
  //             fit: BoxFit.fill,
  //           )),
  //       trailingIcon: widget.withSuffixIcon ? Container(
  //           padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
  //           child: SvgPicture.asset(
  //             ImageAssets.downIc,
  //             fit: BoxFit.fill,
  //           )) : const Text(''),
  //       dropdownMenuEntries: widget.items.map((e) => DropdownMenuEntry(value: e.id, label: e.name)).toList(),
  //       inputDecorationTheme: InputDecorationTheme(
  //       filled: true,
  //       fillColor: widget.fillColor,
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(15.sp),
  //         borderSide: BorderSide(color: ColorManager.grey),
  //       ),
  //       disabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(15.sp),
  //         borderSide: BorderSide(color: ColorManager.grey),
  //       ),
  //     ),
  //   );
  // }
}
