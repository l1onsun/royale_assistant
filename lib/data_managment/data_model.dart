import 'package:flutter/material.dart';
import 'package:royale_flutter/data_managment/blank_data_model.dart';

import 'package:royale_flutter/data_managment/keyvalue_storage.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/data_managment/sql_storage.dart';

Future<DataModel> createDataModel(_) async {
  var dm = DataModel._();
  await dm._initStorages();
  return dm;
}

class DataModel {
  //extends ChangeNotifier {
  var _playerModels = Map<String, PlayerModel>();

  final _keyValueStorage;
  final _sqlStorage = SQLStorage();

  DataModel._() : _keyValueStorage = KeyValueStorage();
  factory DataModel.blank() {
    return BlankDataModel();
  }

  _initStorages() async {
    await _keyValueStorage.init();
    await _sqlStorage.init();
    //notifyListeners();
  }

  Stream<PlayerData> currentPlayerStream() {
    return playerStream(_keyValueStorage.currentPlayerTag);
  }

  Stream<PlayerData> playerStream(String tag) {
    if (_playerModels.containsKey(tag))
      return _playerModels[tag].steam;
    else
      // TODO: handle if player cached or not
      return (_playerModels[tag] = PlayerModel(tag)).steam;
  }
}
