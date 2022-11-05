import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../model/data_model.dart';

class AppState extends ChangeNotifier {
  int temp = 30;

  void updateTemp(int temp) {
    this.temp = temp;
    notifyListeners();
  }

  //! Timer Function

  int start = 0;
  void updateStart(int start) {
    this.start = start;
    notifyListeners();
  }

  void getTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateStart(timer.tick);
    });
  }

  //! Provider with Async
  String name = 'Code with Mannan';

  void updateName(String name) {
    this.name = name;
    notifyListeners();
  }

  Future<void> getName(String name) async {
    Future.delayed(const Duration(seconds: 5), () {
      updateName(name);
    });
  }

  //! Change the WIdget

  bool change = false;
  void updateWidget() {
    this.change = !change;
    notifyListeners();
  }

  //! Provider Working with rest api
  List<DataModel> dataList = [];

  void updateDataModel(List<DataModel> dataList) {
    this.dataList = dataList;
    notifyListeners();
  }
}
