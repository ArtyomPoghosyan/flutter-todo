import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/auth.dart';

class IndexBar extends StatefulWidget {
  IndexBar({
    super.key,
  });

  @override
  State<IndexBar> createState() => _IndexBar();
}

class _IndexBar extends State<IndexBar> {
  final FirebaseAuthStore firebaseStore = FirebaseAuthStore();

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
                child: firebaseStore.user?.photoURL != null
                    ? Image.network(
                        firebaseStore.user!.photoURL!,
                        width: 42,
                        height: 42,
                      )
                    : Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
