import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tododifficult/components/change_account_pass.dart';

import '../components/add_task.dart';
import '../components/change_account_name.dart';
import 'calendar.dart';
import 'task_priority.dart';

void ShowDialog(BuildContext context, String dialogTitle) {
  final formField = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

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
              child: Column(
                children: [
                  Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: formField,
                      child:
                          // Column(
                          // children: [
                          dialogTitle == "Change account name"
                              ? ChangeAccountName(
                                  titleController: titleController,
                                )
                              : dialogTitle == "Change account Password"
                                  ? ChangeAccountPassword(
                                      oldPasswordController:
                                          oldPasswordController,
                                      newPasswordController:
                                          newPasswordController)
                                  : addTasksComponent(
                                      titleController: titleController,
                                      descriptionController:
                                          descriptionController,
                                    )
                      // ],
                      // ),
                      ),
                ],
              ),
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
                                        onTap: () => showCalendar(context),
                                        child: Icon(Icons.timer, size: 24),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(Icons.pin_drop_rounded,
                                            size: 24),
                                      ),
                                      InkWell(
                                        onTap: () =>
                                            {showTaskPriority(context)},
                                        child: const Icon(
                                          Icons.flag,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  )),
                              InkWell(
                                onTap: () {
                                  print(
                                      '${titleController.text} ${descriptionController.text}');
                                  if (formField.currentState!.validate()) {
                                    showCalendar(context);
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
                                onPressed: () {}, child: Text("Edit")),
                          ],
                        ))
            ]);
      });
}
