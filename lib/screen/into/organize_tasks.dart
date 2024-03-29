import 'package:flutter/material.dart';

import '../../widget/back_next_btn_container.dart';
import '../../widget/skip.dart';
import '../../widget/three_lines.dart';

class OrganizeTasks extends StatelessWidget {
  const OrganizeTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 8),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skip(skip: '/welcome'),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "images/organize.png",
                          ),
                          SizedBox(height: 51),
                          ThreeLines(),
                          SizedBox(height: 50),
                          Text(
                            "Organize your tasks",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 42),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                            child: Text(
                              "You can organize your daily tasks by adding your tasks into separate categories",
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 107,
                          ),
                          BackNextBtn(back: "/create", next: "/welcome"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
