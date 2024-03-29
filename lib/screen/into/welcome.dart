import 'package:flutter/material.dart';

import '../../utils/constant.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Welcome to UpTodo",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(44, 26, 44, 370),
              child: Center(
                child: Text(
                  "Please login to your account or create new account to continue",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: Text("LOGIN"),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)))),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(color: pinkColor, width: 2))),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/registration");
                      },
                      child: Text("CREATE ACCOUNT")),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
