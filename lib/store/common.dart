import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'common.g.dart';

class CommonStore extends TCommonStore {
  static final CommonStore _singleton = CommonStore._internal();
  factory CommonStore() {
    return _singleton;
  }
  CommonStore._internal();
}

class TCommonStore = _CommonStore with _$CommonStore;

abstract class _CommonStore with Store {
  @observable
  late Map<String, dynamic> task = {};

  @observable
  late String taskId;

  @action
  void setTaskId(val) {
    if (val != null) {
      taskId = val;
      getData();
    }
  }

  Future<void> getData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("user").doc(taskId).get();
    if (snapshot.exists) {
      task = snapshot.data() as Map<String, dynamic>;
    }
  }
}
