import 'package:flutter/material.dart';

class TaskPriorityDialog extends StatefulWidget {
  @override
  _TaskPriorityDialogState createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<TaskPriorityDialog> {
  int selectedCardIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = List.generate(10, (index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedCardIndex = index + 1;
          });
        },
        child: Card(
          color: selectedCardIndex == index + 1
              ? Color.fromRGBO(134, 135, 231, 1)
              : Color.fromRGBO(39, 39, 39, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Container(
            width: 58,
            height: 58,
            child: Padding(
              padding: EdgeInsets.only(top: 7),
              child: Container(
                child: Column(
                  children: [
                    const Icon(
                      Icons.flag,
                      size: 24,
                      color: Colors.white,
                    ),
                    Text(('${index + 1}')),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    return AlertDialog(
      backgroundColor: Color.fromRGBO(54, 54, 54, 1),
      title: Center(
        child: Column(
          children: [
            const Text("Task Priority"),
            Divider(
              thickness: 1,
              color: Color.fromRGBO(151, 151, 151, 1),
            ),
          ],
        ),
      ),
      content: Container(
        child: Wrap(
          children: cards,
        ),
      ),
      actions: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Save logic here
                  print(selectedCardIndex);
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

void showTaskPriority(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return TaskPriorityDialog();
    },
  );
}
