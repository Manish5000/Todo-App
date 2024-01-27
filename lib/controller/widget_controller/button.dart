

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/widget_controller/color.dart';

class BtnCustom{
  static final BtnCustom _singleton = BtnCustom._internal();
  factory BtnCustom() {
    return _singleton;
  }
  BtnCustom._internal();

  static Widget mainButton({
    Color? btnColor,
    double? titleSize,
    Color? titleColor,
    double? width,
    double? height,
    double? borderRadius,
    BoxBorder? border,
    required String title,
    required VoidCallback onPress,
  }){
    return InkWell(
      onTap: (){},
      child: MaterialButton(
        padding: EdgeInsets.zero,
        splashColor: AppColors.primaryColor,
        elevation: 5.0,
        color: btnColor ?? AppColors.primaryColor,
        height: height ?? 50.0,
        minWidth: width ?? Get.width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(borderRadius ?? 10.0))),
        onPressed: onPress,
        child: Text(title, style: TextStyle(fontSize: titleSize ?? 15.0,color: titleColor ?? AppColors.whiteColor,fontWeight: FontWeight.w500,letterSpacing: 0.4),textAlign: TextAlign.center,)),
    );
  }
}