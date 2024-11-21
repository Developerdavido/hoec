import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/colors.dart';


class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key, this.onBackTap, this.iconColor, this.btnColor, this.icon, this.iconSize, this.height, this.width});

  final VoidCallback? onBackTap;
  final IconData? icon;
  final Color? btnColor;
  final Color? iconColor;
  final double? iconSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBackTap ?? (){
        Get.back();
      },
      child: Container(
        height: height ?? 50.h,
        width: width ?? 50.h,
        decoration: BoxDecoration(
            color: btnColor ?? AppColors.backButtonColor,
            border: Border.all(color: AppColors.borderColor, width: 0.5),
            shape: BoxShape.circle
        ),
        child: Center(
          child: Icon(
            icon ?? CupertinoIcons.chevron_back,
            color: AppColors.primaryColor,
            size: iconSize ?? 16.sp,
          ),
        ),
      ),
    );
  }
}
