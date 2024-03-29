import 'package:flutter/material.dart';
import 'package:new_todo/screen/index/main_page.dart';

import '../screen/index/calendar_screen.dart';
import '../screen/index/focus_screen.dart';
import '../screen/index/home_screen.dart';
import '../screen/index/profile_screen.dart';

Color pinkColor = Color.fromRGBO(136, 117, 255, 1);
Color DescriptionTextColor = Color.fromRGBO(255, 255, 255, 0.44);

final List<Widget> screensWidget = [
  HomeScreen(),
  CalendarScreen(),
  FocusScreen(),
  ProfileScreen()
];

List categoryList = [
  {
    "id": 1,
    "image": "images/bread.png",
    "name": "Grocery",
    "color": Colors.red
  },
  {
    "id": 2,
    "image": "images/briefcase.png",
    "name": "Work",
    "color": Colors.green
  },
  {
    "id": 3,
    "image": "images/sport.png",
    "name": "Sport",
    "color": Colors.yellow
  },
  {
    "id": 4,
    "image": "images/designX.png",
    "name": "Design",
    "color": const Color.fromARGB(255, 173, 202, 226)
  },
  {
    "id": 5,
    "image": "images/mortarboard.png",
    "name": "University",
    "color": Colors.pink
  },
  {
    "id": 6,
    "image": "images/megaphone.png",
    "name": "Social",
    "color": Colors.lightBlue
  },
  {
    "id": 7,
    "image": "images/music.png",
    "name": "Music",
    "color": const Color.fromARGB(255, 218, 135, 233)
  },
  {
    "id": 8,
    "image": "images/heartbeat.png",
    "name": "Health",
    "color": Colors.amber
  },
  {
    "id": 9,
    "image": "images/video.png",
    "name": "Movie",
    "color": Color.fromARGB(255, 54, 161, 40)
  },
  {
    "id": 10,
    "image": "images/home.png",
    "name": "Home",
    "color": Color.fromARGB(255, 197, 169, 12)
  },
  {
    "id": 11,
    "image": "images/add.png",
    "name": "Create New",
    "color": Colors.lightGreenAccent[400]
  },
];
