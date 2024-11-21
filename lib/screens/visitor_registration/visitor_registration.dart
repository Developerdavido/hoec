import 'package:ewc_hoe/config/context_extension.dart';
import 'package:ewc_hoe/screens/visitor_registration/screen_orientation/vr_mobile.dart';
import 'package:ewc_hoe/screens/visitor_registration/screen_orientation/vr_tablet.dart';
import 'package:flutter/material.dart';

class VisitorRegistration extends StatefulWidget {
  const VisitorRegistration({super.key});

  @override
  State<VisitorRegistration> createState() => _VisitorRegistrationState();
}

class _VisitorRegistrationState extends State<VisitorRegistration> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth > 800) {
            if(context.landScapeOrientation){
              return VisitorRegistrationTablet();
            }
            return VisitorRegistrationMobile();
          }
          return VisitorRegistrationMobile();
        });
  }
}
