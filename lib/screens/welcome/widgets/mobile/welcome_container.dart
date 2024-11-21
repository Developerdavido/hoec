import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../shared_widgets/default_button.dart';
import '../../../../shared_widgets/default_text.dart';


class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key, this.onRegisterTap});
  final VoidCallback? onRegisterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      color: AppColors.primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultText(
            data: AppStrings.welcomeMsg,
            fontFamily: "Oswald",
            fontWeight: FontWeight.w400,
            textColor: AppColors.white,
            fontSize: 36.sp,
            letterSpacing: -1.08,
            lineHeight: 1.2,
            textAlign: TextAlign.center,
          ).animate().slide(
            delay: 200.ms,
            begin: const Offset(0, -0.4), // Start from top of screen
            end: const Offset(0, 0), // End at center
            duration: const Duration(seconds: 1),
            curve: Curves.easeOutBack,
          ),
          Gap(50.h),
          DefaultButton(
            onBtnTap: onRegisterTap!,
            btnText: AppStrings.register,
            btnColor: AppColors.white,
            btnTextColor: AppColors.black,
          ).animate().scale(
            delay: 200.ms,
            duration: 500.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1, 1), // 10% size increase
            curve: Curves.easeOut,
          ),
          Gap(20.h),
          DefaultText(
            data: AppStrings.trademark,
            fontFamily: "Geist",
            fontWeight: FontWeight.w400,
            textColor: AppColors.white,
            fontSize: 10.sp,
            letterSpacing: -0.14,
            lineHeight: 2.1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
