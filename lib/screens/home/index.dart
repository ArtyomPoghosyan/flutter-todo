import 'package:flutter/material.dart';
import 'package:tododifficult/widget/show_dialog.dart';
import '../../store/common.dart';
import '../../store/firebase.dart';
import '../../widget/bottom_nav_bar.dart';
import '../../widget/drawer.dart';

class Index extends StatefulWidget {
  Index({super.key});

  @override
  State<Index> createState() => _Index();
}

class _Index extends State<Index> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  final FirebaseStore firebaseStore = FirebaseStore();
  final commonStore = CommonStore();
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    commonStore.isShowAppBar = false;
    firebaseStore.authFirebase.authStateChanges().listen((event) {
      setState(() {
        firebaseStore.setUSer(event);
      });
    });
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onTapItem(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: commonStore.screensWidget,
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
          onPressed: () => ShowDialog(context, "Add Task"),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: DrawerWidget(),
    );
  }
}
