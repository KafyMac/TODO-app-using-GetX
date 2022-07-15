import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/Task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  //List<Task> get tasklist => taskList.value;

  TextEditingController? textEditingController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController!.clear();
  }

  void addTask() {
    print("calling a task");
    String txt = textEditingController!.text;
    DateTime time = DateTime.now();

    taskList.add(Task(txt, time.day.toString()));
    textEditingController!.text = "";
    print(taskList.length);
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }
}
