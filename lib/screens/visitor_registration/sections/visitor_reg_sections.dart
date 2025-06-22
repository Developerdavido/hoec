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
            validator: (value){
              //if value is null or is empty
              if(value == null || value.isEmpty) {
                return "The phone number field must not be empty";
              }
              //if value does not match regex
              RegExp validPhone = RegExp(r'^(\+233|233|0)[0-9]{9}$');
              if(!validPhone.hasMatch(value)) {
                return "Invalid phone number";
              }
              return null;
            },
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
