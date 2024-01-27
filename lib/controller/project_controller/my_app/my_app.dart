
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/project_controller/route/route_navigation.dart';
import 'package:todoapp/controller/widget_controller/color.dart';
import 'package:todoapp/controller/widget_controller/printlog.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor));
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {

    switch (state) {
      
      case AppLifecycleState.resumed:
        PrintLog.printLog("Main App Lifecycle State::::::::: Resumed");
        break;
      case AppLifecycleState.inactive:
        PrintLog.printLog("Main App Lifecycle State::::::::: InActive");
        break;
      case AppLifecycleState.paused:
        PrintLog.printLog("Main App Lifecycle State::::::::: Paused");
        break;
      case AppLifecycleState.detached:
        PrintLog.printLog("Main App Lifecycle State::::::::: Detached");
        break;
      case AppLifecycleState.hidden:
        PrintLog.printLog("Main App Lifecycle State::::::::: Hidden");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: RouteNavigation.splashScreenRoute,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteNavigation.generateRoute,
        title: "Todo",
        darkTheme: ThemeData(
          brightness: Brightness.light,
        ),
        theme: ThemeData.light(useMaterial3: true),
        themeMode: ThemeMode.light,
      );
  }
}