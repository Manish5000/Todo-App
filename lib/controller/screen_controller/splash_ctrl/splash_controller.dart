import 'package:get/get.dart';
import 'package:todoapp/controller/project_controller/route/route_navigation.dart';

class SplashController extends GetxController{

  double opacity = 0.0;

  @override
  void onInit() {
    runSplash();
    super.onInit();
  }

  void runSplash() {
    opacity = 1.0;
    Future.delayed(const Duration(seconds: 2),(){
     Get.toNamed(RouteNavigation.homeScreenRoute);
    });
    update();
  }
}