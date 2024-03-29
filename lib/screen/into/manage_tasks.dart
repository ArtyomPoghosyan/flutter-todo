import 'package:flutter/material.dart';

import '../../widget/back_next_btn_container.dart';
import '../../widget/skip.dart';
import '../../widget/three_lines.dart';

class ManageTasks extends StatelessWidget {
  const ManageTasks({super.key});

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
                            "images/manage.png",
                          ),
                          SizedBox(height: 51),
                          ThreeLines(),
                          SizedBox(height: 50),
                          Text(
                            "Manage your tasks",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 42),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                            child: Text(
                              "You can easily manage all of your daily tasks in DoMe for free",
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 107,
                          ),
                          BackNextBtn(back: "/", next: "/createroutine"),
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
    ;
  }
}
