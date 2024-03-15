import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/firebase.dart';

class IndexBar extends StatefulWidget {
  IndexBar({
    super.key,
  });

  @override
  State<IndexBar> createState() => _IndexBar();
}

class _IndexBar extends State<IndexBar> {
  final firebaseStore = FirebaseStore();

  @override
  void initState() {
    super.initState();
    firebaseStore.authFirebase.authStateChanges().listen((event) {
      setState(() {
        firebaseStore.user = event;
      });
    });
  }

  void handleOpenDrawer() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => handleOpenDrawer(),
              child: Icon(Icons.menu),
            ),
            Text("Index"),
            Observer(
              builder: (builder) => ClipOval(
                child: Image.network(
                  firebaseStore.user?.photoURL ?? Icon(Icons.person).toString(),
                  width: 42,
                  height: 42,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
