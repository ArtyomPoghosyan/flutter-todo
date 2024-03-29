import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _Tasks();
}

class _Tasks extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              itemCount: 3,
              itemBuilder: ((BuildContext context, index) {
                return ListTile(
                  title: Text("ola"),
                );
              }))
        ],
      ),
    );
  }
}
