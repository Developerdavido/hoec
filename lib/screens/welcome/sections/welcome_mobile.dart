import 'package:ewc_hoe/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/media.dart';
import '../../../services/dialog_service.dart';
import '../widgets/mobile/register_modal.dart';
import '../widgets/mobile/welcome_container.dart';



class WelcomeMobile extends StatefulWidget {
  const WelcomeMobile({super.key});

  @override
  State<WelcomeMobile> createState() => _WelcomeMobileState();
}

class _WelcomeMobileState extends State<WelcomeMobile> {
  final dialog = DialogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                Media.sitg,
                height: 0.65.sh,
                width: 1.sw,
                fit: BoxFit.fill,
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WelcomeContainer(
              onRegisterTap: () {
                dialog.showCustomModal(
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.transparent,
                    isDismissible: false,
                    context: context,
                    customModal: const RegisterModal());
              },
            ),
          )
        ],
      ),
    );
  }
}
