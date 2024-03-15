import 'package:flutter/material.dart';

class addTasksComponent extends StatefulWidget {
  final titleController;
  final descriptionController;
  const addTasksComponent(
      {super.key,
      required this.descriptionController,
      required this.titleController});

  @override
  State<addTasksComponent> createState() => _addTasksComponent();
}

class _addTasksComponent extends State<addTasksComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            width: 325,
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please write title';
                  }
                  return null;
                },
                controller: widget.titleController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    hintText: "Title",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(151, 151, 151, 1))))),
          ),
          Container(
            width: 325,
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please write description';
                  }
                  return null;
                },
                controller: widget.descriptionController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    hintText: "Description",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(151, 151, 151, 1))))),
          )
        ],
      ),
    );
  }
}
