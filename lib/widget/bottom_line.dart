import 'package:flutter/material.dart';

class BottomLine extends StatelessWidget {
  const BottomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 136,
        height: 5,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }
}
