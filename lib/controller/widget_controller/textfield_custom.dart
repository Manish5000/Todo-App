import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/widget_controller/color.dart';

class TextFieldCustom extends StatefulWidget{
  TextEditingController controller;
  int? maxLength;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  bool? autofocus;
  InputDecoration? decoration;
  String? labelText;
  String? hintText;
  Color? fillColor;
  Color? outlineBorderColor;
  EdgeInsetsGeometry? contentPadding;
  double? borderRadius;
  InputBorder? enabledBorder;
  TextStyle? style;
  Widget? suffixIcon;
  bool? readOnly;
  Widget? prefix;
  Function(String)? onChanged;
  Function()? ontap;
  String?errorText;
  FocusNode? focusNode;
  bool? obSecureText;
  int? maxLines;
  TextAlignVertical? textAlignVertical;
  TextCapitalization? textCapitalization;

  TextFieldCustom({Key? key,
    required this.controller,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.autofocus,
    this.decoration,
    this.labelText,
    this.hintText,
    this.fillColor,
    this.contentPadding,
    this.outlineBorderColor,
    this.borderRadius,
    this.enabledBorder,
    this.style,
    this.readOnly,
    this.suffixIcon,
    this.onChanged,
    this.prefix,
    this.ontap,
    this.errorText,
    this.focusNode,
    this.obSecureText,
    this.maxLines,
    this.textAlignVertical,
    this.textCapitalization,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool? isFloating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        obscureText: widget.obSecureText ?? false,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        autofocus: widget.autofocus ?? false,
        readOnly: widget.readOnly ?? false,
        onTap:widget.ontap,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
        textAlignVertical: widget.textAlignVertical,
        maxLines: widget.maxLines ?? 1,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged ?? (value){},
        style: widget.style ?? TextStyle(color: AppColors.blackColor,fontWeight: FontWeight.w400,fontSize: 15,),
        decoration: widget.decoration ?? InputDecoration(
          hintStyle: TextStyle(color: AppColors.greyDarkColor,fontWeight: FontWeight.w400, fontSize: 14),
          prefixIconConstraints: const BoxConstraints(maxHeight: 40,maxWidth: 60),
          fillColor: widget.fillColor ??  AppColors.greyLightColor.withOpacity(0.5),
          hintText: widget.hintText ?? "",
          filled: true,
          counterText: "",
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefix != null ? Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: widget.prefix) : const SizedBox(width: 15,),
        contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 15.0, right: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0),
            borderSide: BorderSide(color: widget.outlineBorderColor ?? AppColors.greyLightColor.withOpacity(0.5)),
          ),
          errorBorder:widget.errorText != null ? OutlineInputBorder(
            borderSide :  BorderSide(
                color: AppColors.redNormalColor),
            borderRadius:const BorderRadius.all(Radius.circular(8.0)),
          ):InputBorder.none,
          errorText: widget.errorText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.outlineBorderColor ?? AppColors.primaryColor,width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          ),
          enabledBorder: widget.enabledBorder ??  OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
            borderSide: BorderSide(
                color: widget.errorText != null && widget.errorText != "" ? AppColors.redNormalColor: widget.outlineBorderColor ?? AppColors.greyLightColor.withOpacity(0.5),width: 1
            ),
          ),
        ),
      ),
    );
  }
}