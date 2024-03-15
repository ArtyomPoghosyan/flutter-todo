import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class FingerPrintAuth = _FingerPrintAuth with _$FingerPrintAuth;

abstract class _FingerPrintAuth with Store {
  final _auth = LocalAuthentication();

  @observable
  bool isAuthenticatedBoll = false;

  @action
  Future<void> authenticate() async {
    print(_auth);
    bool authenticated = false;
    try {
      isAuthenticatedBoll = true;
      authenticated = await _auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ));
    } catch (e) {
      print(e);
    }
  }
}
