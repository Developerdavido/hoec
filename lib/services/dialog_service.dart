


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../constants/colors.dart';

class DialogService {
  Future<T?>? showCustomDialog<T>({
    required BuildContext context,
    required Widget customDialog,
    bool? barrierDismissible = true,
    bool? automaticallyClosed = false,
  }) {
    return showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        barrierDismissible: barrierDismissible!,
        barrierColor: AppColors.primaryColor.withOpacity(0.3),
        barrierLabel: "dialog barrier",
        transitionDuration: const Duration(milliseconds: 400),
        transitionBuilder: (context, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          Future.delayed(const Duration(seconds: 2)).then((value) {
            if (automaticallyClosed!) {
              Navigator.pop(context);
            }
          });
          return Transform.scale(scale: curve, child: customDialog);
        });
  }

  Future<T?>? showCustomModal<T>({
    required BuildContext context,
    required Widget customModal,
    Color? backgroundColor = Colors.transparent,
    Color? barrierColor = Colors.transparent,
    bool? isDismissible = true,
    AnimationController? animationController,
    bool? isScrollControlled = true,
  }) {
    return showModalBottomSheet(
        backgroundColor: backgroundColor,
        isScrollControlled: isScrollControlled!,
        barrierColor: barrierColor,
        isDismissible: isDismissible!,
        elevation: 0.0,
        transitionAnimationController: animationController,
        useRootNavigator: true,
        context: context,
        builder: (context) {
          return customModal;
        });
  }


  //snackbar for getting dialogs
  showSnackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.white,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
      snackStyle: SnackStyle.FLOATING,
      overlayBlur: 10.h,
      overlayColor: AppColors.white.withOpacity(0.2),
      titleText: Text(
        title,
        style: TextStyle(
          color: AppColors.grey35,
          fontWeight: FontWeight.w700,
          fontFamily: "Geist",
          fontSize: 16.sp,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppColors.grey35,
          fontWeight: FontWeight.w700,
          fontFamily: "Geist",
          fontSize: 14.sp,
        ),
      ),
    );
  }
}