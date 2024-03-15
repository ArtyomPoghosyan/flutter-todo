import 'package:flutter/material.dart';

class ChangeAccountPassword extends StatefulWidget {
  final oldPasswordController;
  final newPasswordController;
  const ChangeAccountPassword(
      {super.key,
      required this.newPasswordController,
      required this.oldPasswordController});

  @override
  State<ChangeAccountPassword> createState() => _ChangeAccountPassword();
}

class _ChangeAccountPassword extends State<ChangeAccountPassword> {
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
                    return 'Please write oldPassword';
                  }
                  return null;
                },
                controller: widget.oldPasswordController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    hintText: "New password",
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
                    return 'Please write NewPassword';
                  }
                  return null;
                },
                controller: widget.newPasswordController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    hintText: "Old password",
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
