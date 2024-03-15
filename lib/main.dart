import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tododifficult/store/firebase.dart';
import 'routeGenerate.dart';
import 'utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FirebaseStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: basicTheme(),
        initialRoute: "/",
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
