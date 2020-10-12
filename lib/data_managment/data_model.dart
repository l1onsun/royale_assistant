import 'package:royale_flutter/data_managment/blank_data_model.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';

import 'package:royale_flutter/data_managment/keyvalue_storage.dart';
import 'package:royale_flutter/data_managment/player_model.dart';

class DataModel {
  static Future<DataModel> futureCreate(_) async {
    var dm = DataModel._();
    await dm._initStorages();
    return dm;
  }

  var _loadedPlayerModels = Map<String, PlayerModel>();
  var _clanModels = Map<String, ClanModel>();

  PlayerModel currentPlayerAwait;

  final _keyValueStorage;

  DataModel._() : _keyValueStorage = KeyValueStorage();
  factory DataModel.blank() {
    return BlankDataModel();
  }

  _initStorages() async {
    await _keyValueStorage.init();
  }

  Stream<PlayerData> currentPlayerStream() {
    var tag = _keyValueStorage.currentPlayerTag;
    if (tag == Null) {
      currentPlayerAwait = PlayerModel();
      return currentPlayerAwait.steam;
    } else
      return playerStream(tag);
  }

  PlayerData currentPlayerData() {
    return PlayerData.blank(); // TODO: Do i need this method?
  }

  Stream<PlayerData> playerStream(String tag) {
    if (_loadedPlayerModels.containsKey(tag))
      return _loadedPlayerModels[tag].steam;
    else
      // TODO: handle if player cached or not
      return (_loadedPlayerModels[tag] = PlayerModel(tag)).steam;
  }

  PlayerData playerData(String tag) {
    if (_loadedPlayerModels.containsKey(tag))
      return _loadedPlayerModels[tag].player;
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
