import 'package:flutter/material.dart';

import 'package:royale_flutter/data_managment/keyvalue_storage.dart';
import 'package:royale_flutter/data_managment/sql_storage.dart';

class DataModel {
  //extends ChangeNotifier {

  final keyValueStorage = KeyValueStorage();
  final sqlStorage = SQLStorage();
  bool inited = false;

  DataModel() {
    _initStorages();
  }

  _initStorages() async {
    await keyValueStorage.init();
    await sqlStorage.init();
    inited = true;
    //notifyListeners();
  }

  String playerName = "unknown player";
}
