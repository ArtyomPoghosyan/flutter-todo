import 'dart:async';

import 'package:flutter/material.dart';

import '../../widget/bottom_line.dart';
import 'manage_tasks.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => ManageTasks()));
    });
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/logo.png",
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "UpTodo",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.9,
              bottom: 0,
              left: MediaQuery.of(context).size.width * 0.32,
              right: MediaQuery.of(context).size.width * 0.32,
              child: BottomLine(),
            ),
          ],
        ),
      ),
    );
  }
}
