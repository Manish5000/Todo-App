
import 'package:flutter/material.dart';
import 'package:todoapp/view/add_task/add_task_screen.dart';
import 'package:todoapp/view/home/home_screen.dart';
import 'package:todoapp/view/onboaring/splash_screen.dart';

class RouteNavigation{

  static const String splashScreenRoute = '/';
  static const String homeScreenRoute = 'home_screen';
  static const String addTaskScreenRoute = 'add_task_screen';


  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name) {

    case splashScreenRoute:
    return MaterialPageRoute(builder: (context) => const SplashScreen());
    
    case homeScreenRoute:
    return MaterialPageRoute(builder: (context) => const HomeScreen());
    
    case addTaskScreenRoute:
    return MaterialPageRoute(builder: (context) => const AddTaskScreen());


    default:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
