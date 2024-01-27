import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controller/project_controller/route/route_navigation.dart';
import 'package:todoapp/model/todo_model.dart';

import '../../project_controller/database/MyDatabase.dart';
import '../../widget_controller/pop_up/popup_custom.dart';
import '../../widget_controller/printlog.dart';

class HomeController extends GetxController{

  bool isShowDelete = false;
  bool isLoading = false;

  List<TodoModel> todoList = [];

  @override
  void onInit(){
    initCalling();
    super.onInit();
  }

  Future<void> initCalling()async{
    await getTodoListFromDB();
  }

  /// OnTap Delete All
  onTapDeleteAll()async{
    showDeleteAllTodoPopUp(
      onValue: (value) async {
        if(value != null){
          // todoList.removeAt(index);
          await MyDatabase().deleteEverything().then((value) {
            initCalling();
          });
          update();
        }
      },
    );
    update();
  }

  /// OnTap Todo
  onTapTodo({required int index})async{
    todoList[index].isCompleted = "true";
    await MyDatabase().updateTodoIsCompletedValue(todoId: int.parse(todoList[index].id ?? ""),isCompleted: "true").then((value) {
      initCalling();
    });
    update();
  }

  /// Change Delete Value
  onTapChangeDelete(){
    isShowDelete = !isShowDelete;
    update();
  }

  /// OnTap Delete Button on Todo
  onTapDeleteTodo({required int index}){
    showDeleteTodoPopUp(
      onValue: (value) async {
        if(value != null){
          // todoList.removeAt(index);
          await MyDatabase().deleteTodo(int.parse(todoList[index].id ?? "")).then((value) {
            initCalling();
          });
          update();
        }
      },
    );
  }

  /// OnTap Add Task Button
  onTapAdd(){
    Get.toNamed(RouteNavigation.addTaskScreenRoute)?.then((value) {
      isShowDelete = false;
      initCalling();
      update();
    });
  }

  /// Delete Todo PopUp
  showDeleteTodoPopUp({required Function(dynamic) onValue}){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DeleteTodoPopUp(onTapDelete: () => Navigator.of(context).pop(true),desc: "Are you sure you want to delete this task ?",);
      }
    ).then(onValue);
  }
  
  /// Delete All Todo PopUp
  showDeleteAllTodoPopUp({required Function(dynamic) onValue}){
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DeleteTodoPopUp(onTapDelete: () => Navigator.of(context).pop(true),desc: "Are you sure you want to delete all todo task ?",);
      }
    ).then(onValue);
  }
  
  /// Get Data From DB
  Future<List<TodoModel>?> getTodoListFromDB() async {
    changeLoadingValue(true);
    todoList.clear();
      try{
        await MyDatabase().getTodoList().then((value) async {
        if (value.isNotEmpty) {
          await Future.forEach(value, (element) {
            TodoModel todoDataList = TodoModel();
            todoDataList.id = element.id.toString();
            todoDataList.title = element.title;
            todoDataList.isCompleted = element.isCompleted;

            todoList.add(todoDataList);
            changeLoadingValue(false);
            update();
          });
          PrintLog.printLog("Data Get From DB :::: ${todoList.map((e) => e.toJson())}");
        } else{
          changeLoadingValue(false);  
        }
        update();
      });
      }catch(e){
        changeLoadingValue(false);
        PrintLog.printLog("Exception ::: $e");
      }
      changeLoadingValue(false);
      return todoList;
  }

  void changeLoadingValue(value){
    isLoading = value;
    update();
  }
}