import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/screen_controller/home_ctrl/home_controller.dart';
import 'package:todoapp/controller/widget_controller/color.dart';
import 'package:todoapp/controller/widget_controller/loader/loader.dart';
import 'package:todoapp/controller/widget_controller/string_define.dart';
import 'package:todoapp/controller/widget_controller/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: homeCtrl,
      builder: (controller) {
        return LoadScreen(
          isLoading: controller.isLoading,
          widget: Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Image.asset(AppString.strImgBg,fit: BoxFit.fill)),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                    child: Column(
                      children: [
                            
                        /// App Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor
                              ),
                              child: Icon(Icons.menu_rounded,color: AppColors.primaryColor,size: 30)),
                            Transform.translate(
                              offset: Offset(0, Get.height * 0.045),
                              child: BuildText.buildText(text: AppString.kTodo,size: 24,weight: FontWeight.w500,color: AppColors.whiteColor)),
                  
                            controller.todoList.isNotEmpty ? 
                            InkWell(
                              onTap: () => controller.onTapChangeDelete(),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor
                                ),
                                child: Icon(!controller.isShowDelete ? Icons.delete_outline : Icons.clear_rounded,color: AppColors.primaryColor,size: 30))) : buildSizeBox(0.0, 30.0)
                          ],
                        ),
                        buildSizeBox(40.0, 0.0),
                            
                        /// Task List
                        if(controller.todoList.isNotEmpty)
                        DelayedDisplay(
                          child: Container(
                            height: Get.height * 0.65,
                            child: ListView.builder(
                              // reverse: true,
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.only(left: Get.width * 0.1,right: Get.width * 0.04,top: Get.height * 0.03),
                              itemCount: controller.todoList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => controller.onTapTodo(index: index),
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                                    decoration: BoxDecoration(
                                      color: AppColors.arrColorsList[index].withOpacity(controller.todoList[index].isCompleted == "true" ? 0.2 : 0.4),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        // BuildText.buildText(text: "25-01-2-24",weight: FontWeight.w400,size: 12),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            controller.todoList[index].isCompleted == "true" ?
                                            Icon(Icons.check,color: AppColors.greyColor) :
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor,
                                                shape: BoxShape.circle
                                              ),
                                              child: BuildText.buildText(text: "${index+1}",weight: FontWeight.w500,size: 14,color: AppColors.whiteColor)),
                                            buildSizeBox(0.0, 15.0),
                                            Expanded(child: BuildText.buildText(text: controller.todoList[index].title ?? "",weight: FontWeight.w400,size: 16,color: controller.todoList[index].isCompleted == "true" ? AppColors.greyColor : AppColors.blackColor,decoration: controller.todoList[index].isCompleted == "true" ? TextDecoration.lineThrough : TextDecoration.none)),
                                            // Checkbox(value: true, onChanged: (val){},visualDensity:  const VisualDensity(vertical: -4,horizontal: -4),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),fillColor: MaterialStatePropertyAll(AppColors.primaryColor),),
                                    
                                            controller.isShowDelete ? InkWell(
                                              onTap: () => controller.onTapDeleteTodo(index: index),
                                              child: Icon(Icons.delete,color: AppColors.redColor)) : const SizedBox.shrink()
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                            
                        if(controller.todoList.isEmpty)
                        Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.2),
                          child: Column(
                            children: [
                              SvgPicture.asset(AppString.strSvgEmptyTodo,width: Get.width * 0.6,),
                              BuildText.buildText(text: "Add new task",color: AppColors.primaryColor,size: 16)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: controller.todoList.isNotEmpty,
                  child: FloatingActionButton.extended(
                    heroTag: "btn1",
                    label: Row(
                      children: [
                        Icon(Icons.delete,color: AppColors.whiteColor),
                        buildSizeBox(0.0, 5.0),
                        BuildText.buildText(text: "Delete All",color: AppColors.whiteColor),
                      ],
                    ),
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () => controller.onTapDeleteAll(),
                  ),
                ),
                buildSizeBox(0.0, 10.0),
                FloatingActionButton.extended(
                  heroTag: "btn2",
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add,color: AppColors.whiteColor),
                      buildSizeBox(0.0, 5.0),
                      BuildText.buildText(text: AppString.kTask,color: AppColors.whiteColor),
                    ],
                  ),
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () => controller.onTapAdd(),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}