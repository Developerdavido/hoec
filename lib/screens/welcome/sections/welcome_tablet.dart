import 'package:ewc_hoe/screens/welcome/widgets/tablet/register_modal_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/media.dart';
import '../../../services/dialog_service.dart';
import '../widgets/mobile/register_modal.dart';
import '../widgets/mobile/welcome_container.dart';
import '../widgets/tablet/welcome_container_tablet.dart';

class WelcomeTablet extends StatefulWidget {
  const WelcomeTablet({super.key});

  @override
  State<WelcomeTablet> createState() => _WelcomeTabletState();
}

class _WelcomeTabletState extends State<WelcomeTablet> {
  final dialog = DialogService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 1.sh,
            width: 0.5.sw,
            color: AppColors.borderColor,
            child: Image.asset(
              Media.sitg,
              height: 1.sh,
              width: 0.5.sw,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 1.sh,
            width: 0.5.sw,
            color: AppColors.backgroundColor,
            child: WelcomeContainerTablet(
              onRegisterTap: () {
                    dialog.showCustomModal(
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        isDismissible: false,
                        context: context,
                        customModal: const RegisterModalTablet());
              },
            ),
          )
          // WelcomeContainer(
          //   onRegisterTap: () {
          //     dialog.showCustomModal(
          //         backgroundColor: Colors.transparent,
          //         barrierColor: Colors.transparent,
          //         isDismissible: false,
          //         context: context,
          //         customModal: const RegisterModal());
          //   },
          // )
        ],
      ),
    );
  }
}
