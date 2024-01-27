import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../project_controller/database/MyDatabase.dart';
import '../../widget_controller/printlog.dart';

class AddTaskController extends GetxController{

  TextEditingController titleTextController = TextEditingController();
  
  /// OnTap Add Button
  onTapAdd()async{
    await saveMyDayReminderData(title: titleTextController.text.toString()).then((value) {
      Get.back();
    });
  }

  /// Save Data in DB
  Future<void> saveMyDayReminderData({required String title})async {
    
    TodoDataTableCompanion todoObj;
      todoObj = TodoDataTableCompanion.insert(
        title: title,
        isCompleted: "false"
      );
    await MyDatabase().insertTodoTask(todoObj);
    PrintLog.printLog("Data Saved In DB ::::: $todoObj");
  }

}