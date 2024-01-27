class AppString{
  static final AppString _singleton = AppString._internal();
  factory AppString() {
    return _singleton;
  }
  AppString._internal();

  static const String kIosAppVersion = "1";

  static const String kDownloadPath = '/storage/emulated/0/Vikaki/download';

  static const String kOkay = "Okay";
  static const String kYes = "Yes";
  static const String kSelf = "Please Select Dependent";
  static const String kNo = "No";
  static const String kTodo = "Todo";
  static const String kTask = "Task";
  static const String kAddTask = "Add Task";
  static const String kAdd = "Add";

  /// Images
  static const String strImgLogo = "assets/logo/logo.png";
  static const String strImgBg = "assets/images/bg_image.jpg";

  /// Svg
  static const String strSvgEmptyTodo = "assets/svg/empty_todo.svg";

}