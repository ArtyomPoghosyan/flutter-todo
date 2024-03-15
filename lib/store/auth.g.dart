// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FingerPrintAuth on _FingerPrintAuth, Store {
  late final _$isAuthenticatedBollAtom =
      Atom(name: '_FingerPrintAuth.isAuthenticatedBoll', context: context);

  @override
  bool get isAuthenticatedBoll {
    _$isAuthenticatedBollAtom.reportRead();
    return super.isAuthenticatedBoll;
  }

  @override
  set isAuthenticatedBoll(bool value) {
    _$isAuthenticatedBollAtom.reportWrite(value, super.isAuthenticatedBoll, () {
      super.isAuthenticatedBoll = value;
    });
  }

  late final _$authenticateAsyncAction =
      AsyncAction('_FingerPrintAuth.authenticate', context: context);

  @override
  Future<void> authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  @override
  String toString() {
    return '''
isAuthenticatedBoll: ${isAuthenticatedBoll}
    ''';
  }
}
