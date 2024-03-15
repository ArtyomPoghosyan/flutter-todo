import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tododifficult/screens/home/index.dart';
import 'package:tododifficult/store/firebase.dart';
import 'package:tododifficult/utils/constant.dart';

import '../../store/auth.dart';
import '../../store/common.dart';
import '../../utils/authentification.dart';
import '../../utils/validators.dart';
import 'finger_print.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final firebaseStore = FirebaseStore();
  final fingerPrintAuth = FingerPrintAuth();
  final commonStore = CommonStore();

  final bool isFilledFields = true;
  bool isOpenedViaGoogleAcount = false;
  final formField = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firebaseStore.authFirebase.authStateChanges().listen((event) {
      setState(() {
        firebaseStore.user = event;
      });
    });
  }

  void _handleGoogleSignIn() {
    try {
      setState(() {
        isOpenedViaGoogleAcount = true;
      });
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      firebaseStore.authFirebase.signInWithProvider(_googleAuthProvider);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fingerPrintAuth.isAuthenticatedBoll || !commonStore.isShowAppBar
          ? AppBar()
          : null,
      body: firebaseStore.user != null
          ? Index()
          : SafeArea(
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
                                  await fingerPrintAuth.authenticate();
                                  if (fingerPrintAuth.isAuthenticatedBoll ==
                                      true) {
                                    Navigator.pushNamed(context, "/index");
                                  }
                                }
                              },
                              child: Text(
                                "Login",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (state) => isFilledFields == true
                                              ? Color.fromRGBO(
                                                  134, 135, 231, 0.5)
                                              : Color.fromRGBO(
                                                  134, 135, 231, 1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)))),
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
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
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            side:
                                                BorderSide(color: pinkColor)))),
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
            )),
    );
  }
}
