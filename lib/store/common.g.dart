// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonStore on _CommonStore, Store {
  late final _$taskAtom = Atom(name: '_CommonStore.task', context: context);

  @override
  Map<String, dynamic> get task {
    _$taskAtom.reportRead();
    return super.task;
  }

  bool _taskIsInitialized = false;

  @override
  set task(Map<String, dynamic> value) {
    _$taskAtom.reportWrite(value, _taskIsInitialized ? super.task : null, () {
      super.task = value;
      _taskIsInitialized = true;
    });
  }

  late final _$taskIdAtom = Atom(name: '_CommonStore.taskId', context: context);

  @override
  String get taskId {
    _$taskIdAtom.reportRead();
    return super.taskId;
  }

  bool _taskIdIsInitialized = false;

  @override
  set taskId(String value) {
    _$taskIdAtom.reportWrite(value, _taskIdIsInitialized ? super.taskId : null,
        () {
      super.taskId = value;
      _taskIdIsInitialized = true;
    });
  }

  late final _$_CommonStoreActionController =
      ActionController(name: '_CommonStore', context: context);

  @override
  void setTaskId(dynamic val) {
    final _$actionInfo = _$_CommonStoreActionController.startAction(
        name: '_CommonStore.setTaskId');
    try {
      return super.setTaskId(val);
    } finally {
      _$_CommonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
task: ${task},
taskId: ${taskId}
    ''';
  }
}
