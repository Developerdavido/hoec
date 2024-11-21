import 'package:ewc_hoe/constants/strings.dart';
import 'package:ewc_hoe/providers/auth_provider.dart';
import 'package:ewc_hoe/screens/member_registration/widgets/dropdown_widget.dart';
import 'package:ewc_hoe/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../shared_widgets/textfield.dart';

class MemberRegSection extends StatelessWidget {
  const MemberRegSection({
    required this.formKey,
    this.phoneController,
    this.nameController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController? phoneController;
  final TextEditingController? nameController;

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthProvider>(context);
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField(
            title: "Full name" ,
            controller: nameController! ,
            keyboardType: TextInputType.name,
            hintText: 'Enter your full name',
          ),
          Gap(8.h),
          InputField(
            title: "Phone number" ,
            controller: phoneController! ,
            keyboardType: TextInputType.phone,
            hintText: 'Enter your phone number',
          ),
          Gap(8.h),
          DropDownWidget(
            title: AppStrings.yourCampus,
            selectedItem: authVm.campus,
            items: AuthService.campuses,
            onItemChanged: (value){
              if(value == "Prayer Factory") authVm.setCommunity(null);
              authVm.setCampus(value!);
            },
          ),
          Gap(8.h),
          Visibility(
            visible: authVm.campus == 'Prayer Factory',
            child: DropDownWidget(
              title: AppStrings.yourCommunity,
              selectedItem: authVm.community,
              items: AuthService.communities,
              onItemChanged: (value){
                authVm.setCommunity(value!);
              },
            ),
          )
        ],
      ),
    );
  }
}