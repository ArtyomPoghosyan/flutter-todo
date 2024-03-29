import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class FirebaseAuthStore extends TFirebaseAuthStore {
  static final FirebaseAuthStore _singleton = FirebaseAuthStore._internal();
  factory FirebaseAuthStore() {
    return _singleton;
  }
  FirebaseAuthStore._internal();
}

class TFirebaseAuthStore = _FirebaseAuthStore with _$FirebaseAuthStore;

abstract class _FirebaseAuthStore with Store {
  FirebaseAuth authFirebase = FirebaseAuth.instance;

  @observable
  User? user;

  @action
  void setUser(User? event) {
    user = event;
  }

  @action
  setSignout(event) {
    user = null;
    print('${user}hmoooooooo');
  }
}
