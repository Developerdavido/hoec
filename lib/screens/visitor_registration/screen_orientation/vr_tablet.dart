import 'package:ewc_hoe/providers/auth_provider.dart' as auth;
import 'package:ewc_hoe/screens/saved_info/saved_info.dart';
import 'package:ewc_hoe/screens/visitor_registration/sections/visitor_reg_sections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../shared_widgets/default_back_icon.dart';
import '../../../shared_widgets/default_button.dart';
import '../../../shared_widgets/default_loader.dart';
import '../../../shared_widgets/default_text.dart';


class VisitorRegistrationTablet extends StatefulWidget {
  const VisitorRegistrationTablet({super.key});

  @override
  State<VisitorRegistrationTablet> createState() => _VisitorRegistrationTabletState();
}

class _VisitorRegistrationTabletState extends State<VisitorRegistrationTablet> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameCtrl.dispose();
    phoneCtrl.dispose();
    addressCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<auth.AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.15.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: DefaultBackButton(
                      height: 70.h,
                      width: 70.h,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(40.h),
                            DefaultText(
                              data: AppStrings.visitorTitle,
                              fontFamily: "Geist",
                              fontWeight: FontWeight.w800,
                              textColor: AppColors.black,
                              fontSize: 16.sp,
                              letterSpacing: -0.41,
                              lineHeight: 1.33,
                              textAlign: TextAlign.left,
                            ).animate()
                                .slide(
                              begin: const Offset(0.3, 0),
                              end: const Offset(0, 0), // End at center
                              duration: 600.ms,
                              curve: Curves.easeOutBack,
                            )
                                .fade(begin: 0, end: 1, duration: 500.ms),
                            Gap(4.h),
                            DefaultText(
                              data: AppStrings.visitorMessage,
                              fontFamily: "Geist",
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.black,
                              fontSize: 12.sp,
                              letterSpacing: -0.41,
                              lineHeight: 1.33,
                              textAlign: TextAlign.left,
                            ).animate()
                                .slide(
                              begin: const Offset(0.3, 0),
                              end: const Offset(0, 0), // End at center
                              duration: 600.ms,
                              curve: Curves.easeOutBack,
                            )
                                .fade(begin: 0, end: 1, duration: 500.ms),
                            Gap(40.h),
                            VisitorRegSection(
                              formKey: _formKey,
                              nameController: nameCtrl,
                              homeAddressController: addressCtrl,
                              phoneController: phoneCtrl,
                            ).animate()
                                .slide(
                              begin: const Offset(0, 0.3),
                              end: const Offset(0, 0), // End at center
                              duration: 600.ms,
                              curve: Curves.easeOutBack,
                            )
                                .fade(begin: 0, end: 1, duration: 500.ms),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: DefaultButton(
                      onBtnTap: () async {
                        if(_formKey.currentState!.validate()){
                          FocusManager.instance.primaryFocus?.unfocus();
                          final name = nameCtrl.text.trim();
                          final phoneNumber = phoneCtrl.text.trim();
                          final address = addressCtrl.text.trim();
                          final success  = await authVm.registerAttendee(name: name, phone: phoneNumber, homeAddress: address);
                          if(success){
                            FirebaseAuth.instance.signOut();
                            Get.off(()=> const SavedInfo());
                          }
                        }
                      },
                      btnText: AppStrings.submit,
                      height: 74.h,
                      btnSize: 12.sp,
                      btnColor: AppColors.primaryColor,
                      btnTextColor: AppColors.white,
                    ),
                  ).animate().scale(
                    delay: 200.ms,
                    duration: 500.ms,
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1), // 10% size increase
                    curve: Curves.easeOut,
                  ),
                  Gap(20.h),
                ],
              ),
            ),
            Visibility(
              visible: authVm.isLoading,
              child: const Loader(),
            )
          ],
        ),
      ),
    );
  }
}
