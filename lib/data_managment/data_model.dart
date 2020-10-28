import 'dart:convert';

import 'package:royale_flutter/data_managment/blank_data_model.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';
import 'package:royale_flutter/data_managment/connector.dart';

import 'package:royale_flutter/data_managment/keyvalue_storage.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/logging.dart';

const logger = Logger('data_model');

class WelcomeDialogState {
  static const int wait = 0;
  static const int complete = 1;
  static const int ready = 2;
}

class DataModel {
  static Future<DataModel> futureCreate() async {
    var dm = DataModel._();
    await dm._init();
    dm.welcome = WelcomeDialogState.ready; //ToDo: remove line
    return dm;
  }

  final _loadedPlayerModels = Map<String, PlayerModel>();
  final _loadedClanModels = Map<String, ClanModel>();
  final _connector = Connector();
  final _keyValueStorage = KeyValueStorage();

  final currentPlayerModel = PlayerModel();

  DataModel._();
  factory DataModel.blank() {
    return BlankDataModel();
  }

  _init() async {
    await _keyValueStorage.init();
    _connector.init(this);
    final tag = _keyValueStorage.get("currentPlayerTag");
    if (tag != null) {
      _loadedPlayerModels[tag] = currentPlayerModel;
    }
  }

  int get welcome {
    return _keyValueStorage.get("welcome") ?? WelcomeDialogState.ready;
  }

  set welcome(int value) {
    _keyValueStorage.put("welcome", value);
  }

  put(String key, dynamic value) {
    _keyValueStorage.put(key, value);
  }

  PlayerModel playerModel(String tag) {
    if (_loadedPlayerModels.containsKey(tag))
      return _loadedPlayerModels[tag];
    else {
      // TODO: handle if player cached or not
      _loadedPlayerModels[tag] = PlayerModel();
      _handleNewPlayer(tag);
      return _loadedPlayerModels[tag];
    }
  }

  ClanModel clanModel(String tag) {
    if (_loadedClanModels.containsKey(tag))
      return _loadedClanModels[tag];
    else {
      // TODO: handle if clan cached or not
      _loadedClanModels[tag] = ClanModel();
      _handleNewClan(tag);
      return _loadedClanModels[tag];
    }
  }

  updatePlayerFromJson(Map<String, dynamic> playerJson) {
    _loadedPlayerModels[playerJson['tag']]
        .updatePlayerData(PlayerData.fromJson(playerJson));
  }

  updateClanFromJson(Map<String, dynamic> clanJson) {
    _loadedClanModels[clanJson['tag']]
        .updateClanData(ClanData.fromJson(clanJson));
  }

  updateRiverFromJson(Map<String, dynamic> riverJson) {
    logger.warning(
        "river handling shoud be implementented in updateClanFromJson");
  }

  changeCurrentPlayer(String newTag, [String oldTag]) {
    print("changeCurrentPlayer");
    if (oldTag == null) {
      _loadedPlayerModels[newTag] = currentPlayerModel;
      _handleNewPlayer(newTag);
    } else {
      throw UnimplementedError();
    }
  }

  _handleNewPlayer(String playerTag) {
    _connector.sendRequest(_subscribeRequest());
    _connector.sendRequest(_playerRequest(playerTag));
  }

  _handleNewClan(String clanTag) {
    _connector.sendRequest(_subscribeRequest());
    _connector.sendRequest(_clanRequest(clanTag));
  }

  String _playerRequest(String playerTag) {
    // TODO: Last updated!
    final response = Map<String, dynamic>();
    response['type'] = 'player';
    response['player_tag'] = playerTag;
    return jsonEncode(response);
  }

  String _clanRequest(String clanTag) {
    // TODO: Last updated!
    final response = Map<String, dynamic>();
    response['type'] = 'player';
    response['clan_tag'] = clanTag;
    return jsonEncode(response);
  }

  String _subscribeRequest() {
    final response = Map<String, dynamic>();
    response['type'] = 'subscribe';
    response['clans'] = _loadedClanModels.keys.toList();
    response['players'] = _loadedPlayerModels.keys.toList();
    return jsonEncode(response);
  }

  dispose() {
    print("DataModel dispose"); //ToDO
  }
}
