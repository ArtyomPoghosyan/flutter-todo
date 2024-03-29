import 'package:flutter/material.dart';
import 'package:new_todo/screen/edit/edit.dart';
import 'package:new_todo/screen/index/calendar_screen.dart';
import 'package:new_todo/screen/index/focus_screen.dart';
import 'package:new_todo/screen/index/main_page.dart';
import 'package:new_todo/screen/index/profile_screen.dart';
import 'package:new_todo/screen/into/create_routine.dart';
import 'package:new_todo/screen/into/organize_tasks.dart';
import 'package:new_todo/screen/settings/settings.dart';

import 'screen/auth/login.dart';
import 'screen/auth/registration.dart';
import 'screen/category/category_screen.dart';
import 'screen/into/about.dart';
import 'screen/into/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (builder) => About());
      case "/createroutine":
        return MaterialPageRoute(builder: (builder) => CreateRoutine());
      case "/organizetasks":
        return MaterialPageRoute(builder: (builder) => OrganizeTasks());
      case "/welcome":
        return MaterialPageRoute(builder: (builder) => Welcome());
      case "/login":
        return MaterialPageRoute(builder: (builder) => Login());
      case "/registration":
        return MaterialPageRoute(builder: (builder) => Registration());
      case "/mainscreen":
        return MaterialPageRoute(builder: (builder) => MainScreen());
      case "/focus":
        return MaterialPageRoute(builder: (builder) => FocusScreen());
      case "/calendar":
        return MaterialPageRoute(builder: (builder) => CalendarScreen());
      case "/profile":
        return MaterialPageRoute(builder: (builder) => ProfileScreen());
      case "/category":
        return MaterialPageRoute(builder: (builder) => CategoryScreen());
      case "/settings":
        return MaterialPageRoute(builder: (builder) => Settings());
      case "/edit":
        return MaterialPageRoute(builder: (builder) => Edit(id: ""));
      default:
        return ErrorRoutePage();
    }
  }
}

Route ErrorRoutePage() {
  return MaterialPageRoute(builder: (builder) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Page not found"),
        ),
      ),
    );
  });
}
