import 'package:flutter/material.dart';

class BackNextBtn extends StatefulWidget {
  final page;
  final back;
  const BackNextBtn({super.key, required this.page, required this.back});

  @override
  State<BackNextBtn> createState() => _BackNextBtn();
}

class _BackNextBtn extends State<BackNextBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, widget.back);
            },
            child: Text(
              "BACK",
              style: Theme.of(context).textTheme.headline2,
            )),
        Container(
            width: 90,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, widget.page);
              },
              child: Text("NEXT"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
            ))
      ],
    );
  }
}
