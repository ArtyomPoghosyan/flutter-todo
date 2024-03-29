import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../widget/show_dialog.dart';

class Edit extends StatefulWidget {
  dynamic id;
  Edit({super.key, required this.id});

  @override
  State<Edit> createState() => _Edit();
}

class _Edit extends State<Edit> {
  dynamic task;

  Future<void> getData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(widget.id)
        .get();

    if (snapshot.exists) {
      task = snapshot.data() as Map<String, dynamic>;
    }
  }

  Future<void> handleDelete(id) async {
    await FirebaseFirestore.instance.collection("user").doc(id).delete();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          size: 16,
                        ),
                        SizedBox(width: 21),
                        Text(
                          task['title'] ?? 'No Title',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 37),
                      child: Text(
                        task['description'],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(175, 175, 175, 1)),
                      ),
                    ),
                    SizedBox(height: 34),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Icon(Icons.alarm_outlined),
                              SizedBox(width: 8),
                              Text(
                                "Task Time:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                          Text(DateFormat.MMMMEEEEd()
                              .format(DateTime.parse(task['date']))),
                        ],
                      ),
                    ),
                    SizedBox(height: 34),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Icon(Icons.pin_drop_rounded),
                              SizedBox(width: 8),
                              Text(
                                "Task Category:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                          Text(task['category'] ?? 'No Category'),
                        ],
                      ),
                    ),
                    SizedBox(height: 34),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(children: [
                              Icon(Icons.flag),
                              SizedBox(width: 8),
                              Text(
                                "Task Priority:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ]),
                          ),
                          Text(task['priority'].toString() ?? 'No Priority'),
                        ],
                      ),
                    ),
                    SizedBox(height: 34),
                    InkWell(
                        onTap: () => handleDelete(widget.id),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Delete Task",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 270,
                    ),
                    Center(
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)))),
                          onPressed: () {
                            ShowDialog(context, "Edit task title", widget.id);
                          },
                          child: Text("Edit Task"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
