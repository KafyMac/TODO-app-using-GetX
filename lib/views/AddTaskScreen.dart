import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/TaskController.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("GO"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              "Add New Task",
              style: text.headline5,
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: controller.textEditingController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: "Add Your Task Here!",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                controller.addTask();
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Add Task",
                  style: text.button!.copyWith(color: Colors.white),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      )),
    );
  }
}
