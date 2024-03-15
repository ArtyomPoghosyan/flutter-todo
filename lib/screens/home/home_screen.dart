import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tododifficult/store/common.dart';
import '../../store/firebase.dart';
import '../../widget/drawer.dart';
import '../../widget/index_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final FirebaseStore firebaseStore = FirebaseStore();
  void handleOpenDrawer(context) {
    Scaffold.of(context).openDrawer();

    print("TYom0");
  }

  @override
  void initState() {
    super.initState();
    firebaseStore.authFirebase.authStateChanges().listen((event) {
      setState(() {
        firebaseStore.setUSer(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 13, 24, 0),
          child: Container(
            child: Column(
              children: [
                IndexBar(),
                SizedBox(
                  height: 75,
                ),
                Container(
                    width: 227,
                    height: 227,
                    child: Image.asset("images/checklist.png")),
                SizedBox(
                  height: 10,
                ),
                Text("What do you want to do today?"),
                SizedBox(
                  height: 10,
                ),
                Text("Tap + to add your tasks")
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
