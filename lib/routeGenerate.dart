import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tododifficult/screens/home/index.dart';
import 'package:tododifficult/screens/into/initial_page.dart';
import 'package:tododifficult/screens/login_register/finger_print.dart';
import 'package:tododifficult/screens/login_register/login.dart';
import 'package:tododifficult/screens/login_register/registration.dart';

import 'screens/into/create.dart';
import 'screens/into/manager_page.dart';
import 'screens/into/orgonaize.dart';
import 'screens/into/welcome.dart';
import 'screens/settings/settings.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (builder) => InitialPage());
      case "/manager":
        return MaterialPageRoute(builder: (builder) => ManagerPage());
      case "/create":
        return MaterialPageRoute(builder: (builder) => Create());
      case "/orgonaize":
        return MaterialPageRoute(builder: (builder) => Orgonaize());
      case "/welcome":
        return MaterialPageRoute(builder: (builder) => Welcome());
      case "/login":
        return MaterialPageRoute(builder: (builder) => LoginPage());
      case "/registration":
        return MaterialPageRoute(builder: (builder) => RegistrationPage());
      // case "/fingerprint":
      //   return MaterialPageRoute(builder: (builder) => FingerPrint());
      case "/index":
        return MaterialPageRoute(builder: (builder) => Index());
      case "/settings":
        return MaterialPageRoute(builder: (builder) => Settings());
      default:
        return ErrorRoute();
    }
  }
}

Route ErrorRoute() {
  return MaterialPageRoute(builder: (builder) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Page not Found"),
      )),
    );
  });
}
