import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:tododifficult/screens/home/calendar_screen.dart';
import 'package:tododifficult/screens/home/home_screen.dart';
import 'package:tododifficult/store/firebase.dart';

part 'common.g.dart';

class CommonStore = _CommonStore with _$CommonStore;

abstract class _CommonStore with Store {
  bool isShowAppBar = true;

  final List<Widget> screensWidget = [
    HomeScreen(),
    CalendarScreen(),
  ];
}
