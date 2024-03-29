import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTasksComponent extends StatefulWidget {
  final Function(String) onChangeDesc;
  final Function(String) onChangeTitle;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  dynamic id;
  AddTasksComponent(
      {Key? key,
      required this.titleController,
      required this.descriptionController,
      required this.onChangeDesc,
      required this.onChangeTitle,
      required this.id})
      : super(key: key);

  @override
  State<AddTasksComponent> createState() => _AddTasksComponent();
}

class _AddTasksComponent extends State<AddTasksComponent> {
  Map<String, dynamic>? currentTask;
  late Future _getDataFuture;
  @override
  void initState() {
    super.initState();
    _getDataFuture = getData();
  }

  Future<void> getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(widget.id)
        .get();

    if (snapshot.exists) {
      currentTask = snapshot.data() as Map<String, dynamic>;
      widget.titleController.text = currentTask?['title'];
      widget.descriptionController.text = currentTask?['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _getDataFuture,
      builder: (context, snapshot) {
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
                    controller: widget.id != null && currentTask != null
                        ? TextEditingController(text: currentTask?['title'])
                        : widget.titleController,
                    onChanged: widget.onChangeTitle,
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
                    controller: widget.id != null && currentTask != null
                        ? TextEditingController(
                            text: currentTask?['description'])
                        : widget.descriptionController,
                    onChanged: widget.onChangeDesc,
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
      },
    );
  }
}
