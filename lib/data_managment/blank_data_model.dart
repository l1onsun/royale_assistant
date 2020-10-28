import 'dart:async';

import 'clan_model.dart';
import 'data_model.dart';
import 'player_model.dart';

class BlankDataModel implements DataModel {
  final currentPlayerModel = PlayerModel();
  final blankClanModel = ClanModel();

  int get welcome {
    return WelcomeDialogState.wait;
  }

  set welcome(int value) {
    throw Exception("BlankDataModel welcome");
  }

  put(String key, dynamic value) {
    throw Exception("BlankDataModel put");
  }

  PlayerModel playerModel(String tag) {
    return currentPlayerModel;
  }

  ClanModel clanModel(String tag) {
    return blankClanModel;
  }

  updatePlayerFromJson(Map<String, dynamic> json) {
    throw Exception("BlankDataModel trying updatePlayer");
  }

  updateClanFromJson(Map<String, dynamic> json) {
    throw Exception("BlankDataModel trying updateClan");
  }

  updateRiverFromJson(Map<String, dynamic> riverJson) {
    throw Exception("BlankDataModel trying updateRiver");
  }

  changeCurrentPlayer(String newTag, [String oldTag]) {
    throw Exception("BlankDataModel trying changeCurrentPlayer");
  }

  dispose() {
    print("BlankDataModel dispose"); //ToDO
  }
}
