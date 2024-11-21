import 'dart:developer';

import 'package:ewc_hoe/config/context_extension.dart';
import 'package:ewc_hoe/constants/colors.dart';
import 'package:ewc_hoe/screens/welcome/sections/welcome_mobile.dart';
import 'package:ewc_hoe/screens/welcome/sections/welcome_tablet.dart';
import 'package:ewc_hoe/screens/welcome/widgets/mobile/register_modal.dart';
import 'package:ewc_hoe/screens/welcome/widgets/mobile/welcome_container.dart';
import 'package:ewc_hoe/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/media.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth > 800) {
            if(context.landScapeOrientation){
              log("get orientation ===> ${true}");
              return WelcomeTablet();
            }
            return WelcomeTablet();
          }
          return WelcomeMobile();
        });
  }
}
