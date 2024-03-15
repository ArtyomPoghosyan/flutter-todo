import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/firebase.dart';
import 'package:provider/provider.dart';

class ChangeAccountName extends StatefulWidget {
  TextEditingController titleController = TextEditingController(text: "barev");
  ChangeAccountName({super.key, required this.titleController});

  @override
  State<ChangeAccountName> createState() => _ChangeAccountName();
}

class _ChangeAccountName extends State<ChangeAccountName> {
  final FirebaseStore firebaseStore = FirebaseStore();

  @override
  void initState() {
    super.initState();
    firebaseStore.authFirebase.authStateChanges().listen((event) {
      setState(() {
        firebaseStore.setUSer(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(' barev${firebaseStore.user?.email}');

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
        ],
      ),
    );
  }
}
