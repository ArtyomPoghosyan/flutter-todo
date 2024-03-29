import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_todo/screen/edit/edit.dart';
import 'package:new_todo/screen/index/profile_screen.dart';

import '../../store/auth.dart';
import '../../widget/index_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  final String title;
  final String description;
  final int priority;
  final dynamic date;
  final bool check;

  Client(
      {required this.title,
      required this.description,
      required this.priority,
      required this.date,
      required this.check});

  factory Client.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return Client(
        title: data['title'],
        description: data['description'],
        priority: data['priority'],
        date: data['date'],
        check: data['check']);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final FirebaseAuthStore auth = FirebaseAuthStore();
  bool isChecked = false;
  dynamic formattedDate = "";
  dynamic querySnapshot;
  User? user;
  List? taskData;

  @override
  void initState() {
    super.initState();
    user = auth.authFirebase.currentUser;
  }

  Future<List<Client>> getData() async {
    final snapshot = await FirebaseFirestore.instance.collection("user").get();
    final data = snapshot.docs.map((e) => Client.fromSnapshot(e)).toList();
    taskData = data;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Client>>(
            future: getData(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(24, 13, 24, 0),
                child: Container(
                    child: taskData == null
                        ? Column(
                            children: [
                              IndexBar(),
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 75,
                                    ),
                                    Container(
                                        width: 227,
                                        height: 227,
                                        child: Image.asset(
                                            "images/checklist.png")),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("What do you want to do today?"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Tap + to add your tasks")
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              IndexBar(),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection("user")
                                      .snapshots(),
                                  builder: ((BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    return Expanded(
                                        child: ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: ((context, index) {
                                              isChecked = snapshot
                                                  .data!.docs[index]['check'];

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Edit(
                                                                id: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .id
                                                                    .toString())),
                                                  );
                                                  // print(snapshot.data!.docs[index].id
                                                  //     .toString());
                                                },
                                                child: ListTile(
                                                  leading: Checkbox(
                                                    value: isChecked,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isChecked = value!;
                                                      });
                                                    },
                                                  ),
                                                  title: Text(snapshot.data!
                                                      .docs[index]['title']
                                                      .toString()),
                                                  subtitle: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(DateFormat
                                                              .MMMMEEEEd()
                                                          .format(DateTime
                                                              .parse(snapshot
                                                                          .data!
                                                                          .docs[
                                                                      index]
                                                                  ['date']))),
                                                      Text(snapshot
                                                          .data!
                                                          .docs[index]
                                                              ['category']
                                                          .toString())
                                                    ],
                                                  ),
                                                  trailing: Text(snapshot.data!
                                                      .docs[index]['priority']
                                                      .toString()),
                                                ),
                                              );
                                            })));
                                  })),
                            ],
                          )),
              );
            }),
      ),
      drawer: ProfileScreen(),
    );
  }
}
