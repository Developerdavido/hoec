import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/colors.dart';
import '../../constants/media.dart';
import '../welcome/welcome.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _handleLogin();
  }

  _handleLogin() async {
    _timer = Timer(const Duration(seconds: 2), () {
      Get.offAll(() => const Welcome());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(
              Media.ewcLogo,
              height: 50.h,
              color: AppColors.black,
            )
                .animate()
                .slide(
                  begin: const Offset(0, -0.2), // Start from top of screen
                  end: const Offset(0, 0), // End at center
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOutBack,
                )
                .fade(begin: 0, end: 1, duration: 500.ms),
          ),
        ));
  }
}
