// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FirebaseStore on _FirebaseStore, Store {
  late final _$userAtom = Atom(name: '_FirebaseStore.user', context: context);

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

  late final _$_FirebaseStoreActionController =
      ActionController(name: '_FirebaseStore', context: context);

  @override
  void setUSer(User? newUser) {
    final _$actionInfo = _$_FirebaseStoreActionController.startAction(
        name: '_FirebaseStore.setUSer');
    try {
      return super.setUSer(newUser);
    } finally {
      _$_FirebaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
