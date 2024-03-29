// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirebaseAuthStore on _FirebaseAuthStore, Store {
  late final _$userAtom =
      Atom(name: '_FirebaseAuthStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_FirebaseAuthStoreActionController =
      ActionController(name: '_FirebaseAuthStore', context: context);

  @override
  void setUser(User? event) {
    final _$actionInfo = _$_FirebaseAuthStoreActionController.startAction(
        name: '_FirebaseAuthStore.setUser');
    try {
      return super.setUser(event);
    } finally {
      _$_FirebaseAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSignout(dynamic event) {
    final _$actionInfo = _$_FirebaseAuthStoreActionController.startAction(
        name: '_FirebaseAuthStore.setSignout');
    try {
      return super.setSignout(event);
    } finally {
      _$_FirebaseAuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
