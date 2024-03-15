// import 'package:flutter/material.dart';
// import 'package:local_auth/local_auth.dart';

// class Authentification {
//   static final _auth = LocalAuthentication();
//   static bool isAuthenticated = false;
//   static Future<void> authenticate() async {
//     bool authenticated = false;
//     try {
//       authenticated = await _auth.authenticate(
//           localizedReason: 'Scan your fingerprint to authenticate',
//           options: const AuthenticationOptions(
//             useErrorDialogs: true,
//             stickyAuth: true,
//           ));
//     } catch (e) {
//       print(e);
//     }
//     if (authenticated) {
//       isAuthenticated = authenticated;
//     }
//     // if (!mounted) return;

//     // setState(() {
//     //   _isAuthenticated = authenticated;
//     // });
//   }
// }
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final _auth = LocalAuthentication();
  bool isAuthenticated = false;

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await _auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      setState(() {
        isAuthenticated = authenticated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your widget
  }
}
