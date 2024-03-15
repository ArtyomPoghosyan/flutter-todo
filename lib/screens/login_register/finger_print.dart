// import 'package:flutter/material.dart';
// import 'package:tododifficult/utils/authentification.dart';

// class FingerPrint extends StatefulWidget {
//   const FingerPrint({super.key});

//   @override
//   State<FingerPrint> createState() => _FingerPrint();
// }

// class _FingerPrint extends State<FingerPrint> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("Login to the app"),
//             ElevatedButton(
//                 onPressed: () async {
//                   bool auth = await Authentification.authentication();
//                   print("can auth77788: ${auth}");
//                   if (auth) {
//                     Navigator.pushNamed(context, "/index");
//                   }
//                 },
//                 child: Text("Auth"))
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  _FingerprintPageState createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _authenticate,
              child: const Text('Authenticate with Fingerprint'),
            ),
            if (_isAuthenticated)
              const Text(
                'Authenticated!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _isAuthenticated = authenticated;
    });
  }
}
