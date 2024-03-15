import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'firebase.g.dart';

class FirebaseStore = _FirebaseStore with _$FirebaseStore;

abstract class _FirebaseStore with Store {
  FirebaseAuth authFirebase = FirebaseAuth.instance;

  @observable
  User? user;

  @action
  void setUSer(User? newUser) {
    user = newUser;
  }
}
