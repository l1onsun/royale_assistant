import 'package:flutter/material.dart';
import 'package:royale_flutter/data_managment/blank_data_model.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';

import 'package:royale_flutter/data_managment/keyvalue_storage.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/data_managment/sql_storage.dart';

class DataModel {
  static Future<DataModel> futureCreate(_) async {
    var dm = DataModel._();
    await dm._initStorages();
    return dm;
  }

  var _playerModels = Map<String, PlayerModel>();
  var _clanModels = Map<String, ClanModel>();

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

  PlayerData currentPlayerData() {
    return PlayerData.blank(); // TODO: Do i need this method?
  }

  Stream<PlayerData> playerStream(String tag) {
    if (_playerModels.containsKey(tag))
      return _playerModels[tag].steam;
    else
      // TODO: handle if player cached or not
      return (_playerModels[tag] = PlayerModel(tag)).steam;
  }

  PlayerData playerData(String tag) {
    if (_playerModels.containsKey(tag))
      return _playerModels[tag].player;
    else
      return PlayerData.blank();
  }

  Stream<ClanData> clanStream(String tag) {
    if (_clanModels.containsKey(tag))
      return _clanModels[tag].steam;
    else
      // TODO: handle if clan cached or not
      return (_clanModels[tag] = ClanModel(tag)).steam;
  }

  ClanData clanData(String tag) {
    if (_clanModels.containsKey(tag)) {
      return _clanModels[tag].clan;
    } else {
      return ClanData.blank();
    }
  }
}
