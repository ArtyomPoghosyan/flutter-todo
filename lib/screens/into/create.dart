import 'package:flutter/material.dart';

import '../../widget/back_next_btn_container.dart';
import '../../widget/skip.dart';
import '../../widget/three_lines.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _Create();
}

class _Create extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 14, 24, 8),
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
                          "images/create.png",
                          width: 271,
                          height: 266,
                        ),
                        SizedBox(height: 51),
                        ThreeLines(),
                        SizedBox(height: 50),
                        Text(
                          "Create daily routine",
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(height: 42),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                          child: Text(
                            "In Uptodo  you can create your personalized routine to stay productive",
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 107,
                        ),
                        BackNextBtn(back: "/manager", page: "/orgonaize")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
