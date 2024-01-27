
import 'package:flutter/material.dart';
import 'package:todoapp/controller/widget_controller/color.dart';

class BuildText{

  static Widget buildText({required
  String text,
    TextStyle? style,
    TextDecoration?decoration,
    String?fontFamily,
    double? size,
    double? height,
    FontWeight? weight,
    Color? color,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    double? letterSpacing}){
    return Text(
      text,
      style: style ?? TextStyle(
        fontSize: size ?? 14,
        fontWeight: weight,
        height: height,
        color: color ?? AppColors.blackColor,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: letterSpacing ?? 0.0
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}


Widget buildSizeBox(height,width){
  return SizedBox(height: height, width: width,);
}