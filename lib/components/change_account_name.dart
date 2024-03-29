import 'package:flutter/material.dart';

// import '../store/firebase.dart';

class ChangeAccountName extends StatefulWidget {
  final Function(String) onChange;
  final TextEditingController changedNameController;
  ChangeAccountName(
      {super.key, required this.changedNameController, required this.onChange});

  @override
  State<ChangeAccountName> createState() => _ChangeAccountName();
}

class _ChangeAccountName extends State<ChangeAccountName> {
  // final FirebaseAuthStore firebaseStore = FirebaseAuthStore();
  TextEditingController changedNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    changedNameController;
    // TextEditingController(text: firebaseStore.user?.email ?? "");
  }

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
                controller: changedNameController,
                onChanged: widget.onChange,
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
