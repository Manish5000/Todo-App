import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/screen_controller/add_task_ctrl/add_task_controller.dart';
import 'package:todoapp/controller/widget_controller/button.dart';
import 'package:todoapp/controller/widget_controller/color.dart';
import 'package:todoapp/controller/widget_controller/string_define.dart';
import 'package:todoapp/controller/widget_controller/text.dart';

import '../../controller/widget_controller/textfield_custom.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  @override
  void dispose() {
    Get.delete<AddTaskController>();
    super.dispose();
  }

  AddTaskController addTaskCtrl = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTaskController>(
      init: addTaskCtrl,
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 50,
              leading: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios_rounded,color: AppColors.blackColor,size: 30,)),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildText.buildText(text: AppString.kAddTask,size: 34,weight: FontWeight.w600),
                    buildSizeBox(20.0, 0.0),
                    
                    TextFieldCustom(
                      controller: controller.titleTextController,
                      hintText: "type something",
                      maxLines: 5,
                      contentPadding: const EdgeInsets.only(top: 20),
                    )
                  ],
                ),
              )),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                child: BtnCustom.mainButton(title: AppString.kAdd, onPress: () => controller.onTapAdd()),
              ),
          ),
        );
      }
    );
  }
}