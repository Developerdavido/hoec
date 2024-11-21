import 'dart:ui';

import 'package:ewc_hoe/providers/auth_provider.dart';
import 'package:ewc_hoe/screens/member_registration/member_registration.dart';
import 'package:ewc_hoe/screens/visitor_registration/visitor_registration.dart';
import 'package:ewc_hoe/shared_widgets/default_back_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../shared_widgets/default_button.dart';
import '../../../../shared_widgets/default_text.dart';


class RegisterModalTablet extends StatelessWidget {
  final double? height;
  final double? width;
  const RegisterModalTablet({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              data: AppStrings.registerForEvent,
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.black,
                              fontSize: 12.sp,
                              letterSpacing: -0.41,
                              lineHeight: 1.3,
                              textAlign: TextAlign.center,
                            ),
                            DefaultBackButton(
                              iconSize: 10.sp,
                              icon: CupertinoIcons.clear,
                              iconColor: AppColors.primaryColor,
                            )
                          ],
                        ),
                        Gap(24.h),
                        DefaultButton(
                          height: 70.h,
                          btnSize: 12.sp,
                          onBtnTap: (){
                            Get.back();
                            authVm.setUserType("Member");
                            Get.to(()=> const MemberRegistration());

                          },
                          btnText: AppStrings.member,
                          btnColor: AppColors.primaryColor,
                          btnTextColor: AppColors.white,
                        ),
                        Gap(8.h),
                        DefaultButton(
                          height: 70.h,
                          btnSize: 12.sp,
                          onBtnTap: (){
                            Get.back();
                            authVm.setUserType("Visitor");
                            Get.to(()=> const VisitorRegistration());
                          },
                          btnText: AppStrings.visitor,
                          btnColor: AppColors.backButtonColor,
                          btnTextColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
