import 'package:flutter/material.dart';
import '../../utils/constant.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/show_dialog.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onTapItem(int index) {
    setState(() {
      currentIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: screensWidget,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
          onPageChanged: onPageChanged,
          onTapItem: onTapItem,
          currentIndex: currentIndex),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () => ShowDialog(context, "Add Task", ""),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: DrawerWidget(),
    );
  }
}
