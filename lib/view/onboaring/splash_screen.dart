import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/screen_controller/splash_ctrl/splash_controller.dart';
import 'package:todoapp/controller/widget_controller/color.dart';
import 'package:todoapp/controller/widget_controller/string_define.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashController ctrl = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: ctrl,
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Center(
            child: AnimatedOpacity(
              opacity: controller.opacity,
              duration: const Duration(milliseconds: 1000),
              child: Image.asset(AppString.strImgLogo,width: 150))
          ),
        );
      },
    );
  }
}