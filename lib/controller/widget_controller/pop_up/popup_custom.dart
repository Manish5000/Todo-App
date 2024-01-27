import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/widget_controller/color.dart';
import 'package:todoapp/controller/widget_controller/text.dart';

class DeleteTodoPopUp extends StatelessWidget {
  DeleteTodoPopUp({super.key, required this.onTapDelete, required this.desc});
  VoidCallback? onTapDelete;
  String? desc;
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      child: AlertDialog(
        backgroundColor: AppColors.whiteColor,
        title: BuildText.buildText(
            text: "Delete Task", size: 16, weight: FontWeight.w500),
        content: Text(desc ?? ""),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: BuildText.buildText(
              text: 'Cancel', color: AppColors.blackColor)
          ),
          TextButton(
            onPressed: onTapDelete,
            child: BuildText.buildText(
              text: 'Delete', color: AppColors.blackColor)
          ),
        ],
      ),
    );
  }
}