import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:basic_code_for_any_project/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_code_for_any_project/presentation/resources/styles_manager.dart';

class DefaultDropdownMenuWidget<T> extends StatefulWidget {
  final void Function(T? value) onSelected;
  final String? leadingIcon;
  final List items;
  final String? title;
  final String hintText;
  final bool enabled;
  final bool withSuffixIcon;
  final double? width;
  final String Function(T? item) optionTitle;
  final String Function(T? item) searchOptionTitle;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final String? text;
  final T? selectedValue;
  const DefaultDropdownMenuWidget(
      {super.key,
        required this.onSelected,
        this.leadingIcon,
        required this.items,
        required this.hintText,
        this.enabled = true,
        this.controller,
        this.width,
        this.fillColor,
        this.withSuffixIcon = true,
        this.text,
        required this.selectedValue, this.borderColor, this.title, required this.optionTitle, required this.searchOptionTitle});

  @override
  State<DefaultDropdownMenuWidget<T>> createState() =>
      _DefaultDropdownMenuWidgetState<T>();
}

class _DefaultDropdownMenuWidgetState<T> extends State<DefaultDropdownMenuWidget<T>> {
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
        ? Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title != null)
          Text(widget.title!, style: getRegularStyle(fontSize: 15.sp, color: ColorManager.black),),
        if(widget.title != null)
          SizedBox(height: 5.h,),
        DropdownButtonHideUnderline(
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
                child: const Icon(Icons.keyboard_arrow_down,color: ColorManager.black,),
              )
                  : const Text(''),
            ),
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: getLightStyle(fontSize: 14.sp, color: ColorManager.textColor,height: 2.h),
            ),
            items: widget.items
                .map((item) => DropdownMenuItem<T>(
              value: item,
              child: Text(
                widget.optionTitle(item),
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
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                color: widget.fillColor??ColorManager.fillColor,
                border: Border.all(color: widget.borderColor??ColorManager.greyBorder),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 40.h,
            ),
            dropdownSearchData: DropdownSearchData<T>(
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
                return widget.searchOptionTitle(item.value)
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
      ],
    )
        : Container(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.grey),
      ),
      child: Row(
        children: [
          if(widget.leadingIcon != null)
            Container(
                padding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                child: SvgPicture.asset(
                  widget.leadingIcon!,
                  fit: BoxFit.fill,
                )),
          Text(widget.text??widget.hintText,style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: widget.text == null ? ColorManager.grey : ColorManager.black),),
          if(widget.withSuffixIcon)
            const Spacer(),
          if(widget.withSuffixIcon)
            Container(
              decoration: const BoxDecoration(
                  color: ColorManager.primary, shape: BoxShape.circle),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: ColorManager.white,
              ),
            ),
        ],
      ),
    );
  }
}