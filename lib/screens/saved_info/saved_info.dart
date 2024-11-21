import 'package:ewc_hoe/config/context_extension.dart';
import 'package:ewc_hoe/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';
import '../../constants/media.dart';
import '../../constants/strings.dart';
import '../../shared_widgets/default_button.dart';
import '../../shared_widgets/default_text.dart';

class SavedInfo extends StatelessWidget {
  const SavedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 154.h,
              width: 154.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.successContainer),
              child: Center(
                child: SvgPicture.asset(
                  Media.clipboard,
                  fit: BoxFit.contain,
                ),
              ),
            ).animate().scale(
                  delay: 200.ms,
                  duration: 500.ms,
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1), // 10% size increase
                  curve: Curves.easeOut,
                ),
            Gap(40.h),
            DefaultText(
              data: AppStrings.successfulReg,
              fontFamily: "Geist",
              fontWeight: FontWeight.w800,
              textColor: AppColors.black,
              fontSize: 20.sp,
              letterSpacing: -0.41,
              lineHeight: 1.33,
              textAlign: TextAlign.center,
            )
                .animate()
                .slide(
                  begin: const Offset(0, 0.3),
                  end: const Offset(0, 0), // End at center
                  duration: 600.ms,
                  curve: Curves.easeOutBack,
                )
                .fade(begin: 0, end: 1, duration: 500.ms),
            Gap(4.h),
            DefaultText(
              data: AppStrings.successfulRegMsg,
              fontFamily: "Geist",
              fontWeight: FontWeight.w400,
              textColor: AppColors.black,
              fontSize: 16.sp,
              letterSpacing: -0.41,
              lineHeight: 1.33,
              textAlign: TextAlign.center,
            )
                .animate()
                .slide(
                  begin: const Offset(0, 0.3),
                  end: const Offset(0, 0), // End at center
                  duration: 600.ms,
                  curve: Curves.easeOutBack,
                )
                .fade(begin: 0, end: 1, duration: 500.ms),
            Gap(30.h),
            DefaultButton(
              onBtnTap: () async {
                Get.offAll(() => const Welcome());
              },
              btnText: AppStrings.home,
              height: context.landScapeOrientation ? 74.h : 56.h,
              width: context.landScapeOrientation ? 0.3.sw : 0.3.sw,
              btnSize: context.landScapeOrientation ? 12.sp : 16.sp,
              btnColor: AppColors.primaryColor,
              btnTextColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
