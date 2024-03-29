import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_todo/screen/index/main_page.dart';

import '../../store/auth.dart';
import '../../utils/constant.dart';
import '../../utils/validators.dart';
import 'firebase_auth_implementation/firebase_auth_services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final formField = GlobalKey<FormState>();
  final FirebaseAuthService auth = FirebaseAuthService();
  final FirebaseAuthStore googleAuth = FirebaseAuthStore();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    String email = usernameController.text;
    String password = passwordController.text;
    var user = await auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      Navigator.pushNamed(context, "/mainscreen");
    } else {
      print("noooo");
    }
  }

  void _handleGoogleSignIn() {
    GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
    googleAuth.authFirebase.signInWithProvider(_googleAuthProvider);
    googleAuth.authFirebase.authStateChanges().listen((event) {
      if (event != null) {
        setState(() {
          googleAuth.setUser(event);
        });
        Navigator.pushNamed(context, "/mainscreen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 41, 24, 33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(height: 53),
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
                                  hintText: "Enter your Username",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
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
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              validator: passwordValidator,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your Password",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  errorMaxLines: 2),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 69,
                      ),
                      Container(
                        width: 327,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formField.currentState!.validate()) {
                              handleLogin();
                              // Navigator.pushNamed(context, "/index");
                              // await fingerPrintAuth.authenticate();
                              // if (fingerPrintAuth.isAuthenticatedBoll ==
                              //     true)
                            }
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          style: ButtonStyle(
                              // backgroundColor:
                              //     MaterialStateProperty.resolveWith<Color>(
                              //         (state) => isFilledFields == true
                              //             ? Color.fromRGBO(
                              //                 134, 135, 231, 0.5)
                              //             : Color.fromRGBO(
                              //                 134, 135, 231, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 31, 0, 39),
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
                    height: 116,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 327,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _handleGoogleSignIn,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("images/google.png"),
                                  SizedBox(width: 10),
                                  Text("Login with Google")
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
                                    side: BorderSide(color: pinkColor)),
                              ),
                            ),
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
                                  Text("Login with Apple")
                                ],
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                      Navigator.pushNamed(context, "/registration");
                    },
                    child: RichText(
                      text: TextSpan(
                          text: "Dont have an account?",
                          children: <TextSpan>[
                            TextSpan(text: " Register", style: TextStyle())
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
