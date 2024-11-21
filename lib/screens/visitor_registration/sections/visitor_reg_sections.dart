import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../shared_widgets/textfield.dart';

class VisitorRegSection extends StatelessWidget {
  const VisitorRegSection({
    required this.formKey,
    this.nameController,
    this.phoneController,
    this.homeAddressController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController? nameController;
  final TextEditingController? phoneController;
  final TextEditingController? homeAddressController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputField(
            title: "Name",
            controller: nameController!,
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
          InputField(
            title: "Home address",
            controller: homeAddressController!,
            keyboardType: TextInputType.text,
            hintText: 'Enter address',
          ),
        ],
      ),
    );
  }
}
