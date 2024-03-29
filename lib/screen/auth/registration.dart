import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_todo/screen/auth/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:tododifficult/utils/constant.dart';
// import 'package:tododifficult/utils/validators.dart';

import '../../utils/constant.dart';
import '../../utils/validators.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _Registration();
}

class _Registration extends State<Registration> {
  final FirebaseAuthService auth = FirebaseAuthService();
  final formField = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    String username = usernameController.text;
    String password = passwordController.text;
    User? user = await auth.signUpWithEmailAndPassword(username, password);
    print(user);
    if (user != null) {
      Navigator.pushNamed(context, "/mainscreen");
    } else {
      print("noooooooooo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 15, 24, 33),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Register",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formField,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username"),
                        SizedBox(height: 8),
                        Container(
                          width: 327,
                          child: TextFormField(
                            controller: usernameController,
                            validator: usernameValidators,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter your Username",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                errorMaxLines: 2),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 25),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password"),
                        SizedBox(height: 8),
                        Container(
                          width: 327,
                          child: TextFormField(
                            controller: passwordController,
                            validator: passwordValidator,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter your Password",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                errorMaxLines: 2),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 25),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Confirm Password"),
                        SizedBox(height: 8),
                        Container(
                          width: 327,
                          child: TextFormField(
                            controller: confirmPasswordController,
                            validator: (value) => confirmPasswordValidator(
                                value, passwordController),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Enter your Password",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                errorMaxLines: 2),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 327,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formField.currentState!.validate()) {
                            signUp();
                          }
                        },
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(134, 135, 231, 0.5)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 18, 0, 24),
                      child: Row(
                        children: [
                          Container(
                            width: 154,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            )),
                          ),
                          Text(" or "),
                          Container(
                            width: 154,
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Container(
                  height: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 327,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/google.png"),
                                SizedBox(width: 10),
                                Text("Register with Google")
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(color: pinkColor)))),
                        ),
                      ),
                      Container(
                        width: 327,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/apple.png"),
                                SizedBox(width: 10),
                                Text("Register with Apple")
                              ],
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(color: pinkColor)))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 46),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an acoount?",
                        children: <TextSpan>[
                          TextSpan(text: " Login", style: TextStyle())
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
