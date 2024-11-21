
import 'package:ewc_hoe/config/context_extension.dart';
import 'package:ewc_hoe/screens/member_registration/screen_orientation/mem_mobile.dart';
import 'package:ewc_hoe/screens/member_registration/screen_orientation/mem_tablet.dart';
import 'package:flutter/material.dart';

class MemberRegistration extends StatefulWidget {
  const MemberRegistration({super.key});

  @override
  State<MemberRegistration> createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth > 800) {
            if(context.landScapeOrientation){
              return MemberRegistrationTablet();
            }
            return MemberRegistrationMobile();
          }
          return MemberRegistrationMobile();
        });
  }
}

