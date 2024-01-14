import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:login_asignment/app/screens/home/home_controller.dart';
import 'package:login_asignment/app/screens/home/home_view.dart';
import 'package:login_asignment/app/screens/login/login_controller.dart';

import 'app/screens/login/login_screen.dart';

void main() {
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => HomeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 930),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Login Asignment',
            home: LoginPage(),
            // HomeScreen(),
          );
        });
  }
}
