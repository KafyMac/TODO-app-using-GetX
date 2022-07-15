import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TaskController.dart';
import 'package:todo/views/AddTaskScreen.dart';

import 'TaskTile.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'GetX ToDo Notes',
            style: TextStyle(color: Colors.red),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 254, 254),
          elevation: 0,
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(AddTaskScreen());
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
            child: Obx(
          () => (controller.taskList.isEmpty)
              ? Center(
                  child: Text(
                    "No Tasks Found!",
                    style: text.headline5,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: ListView.separated(
                    itemCount: controller.taskList.length,
                    itemBuilder: (context, index) => TaskTile(
                      size: size,
                      text: text,
                      time: controller.taskList[index].taskCreated,
                      des: controller.taskList[index].task,
                      press: () {
                        controller.deleteTask(controller.taskList[index]);
                      },
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ),
        )));
  }
}
