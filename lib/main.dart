import 'package:ewc_hoe/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'config/app_theme.dart';
import 'config/providers.dart';
import 'constants/colors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const HOECApp());
}

class HOECApp extends StatelessWidget {
  const HOECApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.successContainer,
      statusBarIconBrightness: Brightness.dark,
    ));
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MultiProvider(
            providers: providers,
            builder: (context, child) {
              return GetMaterialApp(
                title: 'HOEC App',
                debugShowCheckedModeBanner: false,
                theme: AppThemes.appThemeData[AppTheme.darkTheme],
                home: const SplashPage(),
              );
            }
        );
      },
    );
  }
}

