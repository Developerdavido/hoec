import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../constants/colors.dart';
import '../../../shared_widgets/default_text.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget(
      {super.key, this.title, this.selectedItem, this.items, this.onItemChanged});

  final String? title;
  final String? selectedItem;
  final List<String?>? items;
  final Function(String?)? onItemChanged;
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          data: widget.title ?? "",
          fontWeight: FontWeight.w400,
          textColor: AppColors.grey35,
          fontSize: 16,
          letterSpacing: -0.48,
          lineHeight: 1.2,
        ),
        Gap(6.h),
        GestureDetector(
          onTap: (){
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.borderColor, width: 0.5)),
            child: Row(
              children: [
                Expanded(
                  child: DefaultText(
                    data: widget.selectedItem ?? "Select",
                    fontWeight: FontWeight.w500,
                    textColor:
                        widget.selectedItem == null ? AppColors.grey35 : AppColors.black,
                    fontSize: 16,
                    letterSpacing: -0.48,
                    lineHeight: 1.2,
                  ),
                ),
                Icon(
                  _isVisible ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                  size: 12,
                  color: _isVisible ? AppColors.primaryColor : AppColors.black,
                ),
              ],
            ),
          ),
        ),
        Gap(6.h),
        Visibility(
          visible : _isVisible,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 4),
                  blurRadius: 13.3,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.items!.length, (index) {
                var item = widget.items![index];
                return RadioListTile<String>(
                    value: item!,
                    title: DefaultText(
                      data: item ?? "",
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.black,
                      fontSize: 16,
                      letterSpacing: -0.48,
                      lineHeight: 1.2,
                    ),
                    groupValue: widget.selectedItem,
                    activeColor: AppColors.primaryColor,
                    contentPadding: EdgeInsets.zero,
                    tileColor: widget.selectedItem == item
                        ? AppColors.backgroundColor
                        : AppColors.white,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (value){
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                      widget.onItemChanged!(value);
                    });
              }),
            ),
          ),
        )
      ],
    );
  }
}
