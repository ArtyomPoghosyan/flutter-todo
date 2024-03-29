import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/add_task.dart';
import '../components/change_account_name.dart';
import '../components/change_account_pass.dart';
import 'calendar.dart';
import 'category.dart';
import 'task_priority.dart';

class TaskData {
  dynamic date;
  int? priority;
  String? title;
  String? description;
  bool? check;
  String? category;

  TaskData(
      {this.date,
      this.priority,
      this.description,
      this.title,
      this.check,
      this.category});
}

void ShowDialog(BuildContext context, String dialogTitle, dynamic id) {
  final formField = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController changedNameController = TextEditingController();
  TaskData taskData = TaskData();

  void handleDateTimeSelected(DateTime selectedDateTime) {
    taskData.date = selectedDateTime.toString();
  }

  void handlePriority(dynamic priority) {
    if (priority != null) {
      taskData.priority = priority;
    }
  }

  void handleCategoryName(dynamic category) {
    taskData.category = category['name'];
    CollectionReference collRef = FirebaseFirestore.instance.collection("user");
    print('${id}idddddd in the creation');
    if (id != null) {
      print('${id}mtav');
      // collRef.add({
      //   "date": taskData.date,
      //   "description": taskData.description,
      //   "title": taskData.title,
      //   "priority": taskData.priority,
      //   "check": false,
      //   "category": taskData.category
      // });
    } else {
      print("updateeeed");
      print('${id}elaaaaaaaav');
    }
    Navigator.pushNamed(context, "/mainscreen");
  }

  print('${id}iddddddddddddddddddddddddddddddd');

  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
            title: Text(
              dialogTitle,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 0.87)),
            ),
            content: SingleChildScrollView(
                child: Container(
              child: Column(children: [
                Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formField,
                    child: dialogTitle == "Change account name"
                        ? ChangeAccountName(
                            changedNameController: changedNameController,
                            onChange: (value) {
                              changedNameController.text = value;
                            })
                        : dialogTitle == "Change account Password"
                            ? ChangeAccountPassword(
                                oldPasswordController: oldPasswordController,
                                newPasswordController: newPasswordController)
                            : AddTasksComponent(
                                id: id,
                                titleController: titleController,
                                onChangeTitle: (value) {
                                  titleController.text = value;
                                },
                                descriptionController: descriptionController,
                                onChangeDesc: (value) {
                                  descriptionController.text = value;
                                })),
              ]),
            )),
            actions: [
              InkWell(
                  onTap: () {},
                  child: (dialogTitle == "Add Task")
                      ? SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 112,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => showCalendar(
                                            context,
                                            handleDateTimeSelected,
                                            handlePriority,
                                            handleCategoryName),
                                        child:
                                            const Icon(Icons.timer, size: 24),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          ShowCategory(
                                              context, handleCategoryName);
                                        },
                                        child: const Icon(
                                            Icons.pin_drop_rounded,
                                            size: 24),
                                      ),
                                      InkWell(
                                        onTap: () => {
                                          showTaskPriority(
                                              context,
                                              handlePriority,
                                              handleCategoryName)
                                        },
                                        child: const Icon(
                                          Icons.flag,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  )),
                              InkWell(
                                onTap: () {
                                  if (formField.currentState!.validate()) {
                                    taskData.title = titleController.text;
                                    taskData.description =
                                        descriptionController.text;
                                    showCalendar(
                                        context,
                                        handleDateTimeSelected,
                                        handlePriority,
                                        handleCategoryName);
                                  }
                                },
                                child: const Icon(
                                  Icons.send_rounded,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text("Cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  if (formField.currentState!.validate()) {
                                    taskData.title = titleController.text;
                                    taskData.description =
                                        descriptionController.text;
                                    showCalendar(
                                        context,
                                        handleDateTimeSelected,
                                        handlePriority,
                                        handleCategoryName);
                                  }
                                },
                                child: Text("Edit")),
                          ],
                        ))
            ]);
      });
}
