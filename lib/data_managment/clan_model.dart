import 'dart:async';

import 'package:flutter/foundation.dart';

import 'api/api_manager.dart';

class ApiClanData {
  final String tag;
  final String name;
  final int badgeId;
  //"badgeUrls"

  const ApiClanData({this.tag, this.name, this.badgeId});
  const ApiClanData.blank()
      : tag = "#xxxxxxxx",
        name = "Clan Name",
        badgeId = 16000072; //TODO: // fix
  factory ApiClanData.fromJson(json) {
    print("What is badgeUrls ???");
    print(json["badgeUrls"]);
    print(json["badgeId"]);
    return ApiClanData(tag: json["tag"], name: json["name"]);
  }
}

class FameForm {
  final DateTime timeChange;
  final int fame;
  final int repairPoints;
  final String clanTag;
  const FameForm({this.timeChange, this.fame, this.repairPoints, this.clanTag});
  factory FameForm.blank() {
    return FameForm();
  }
  factory FameForm.fromJson(Map<String, dynamic> json) {
    return FameForm(
      timeChange: json['time_change'],
      fame: json['fame'],
      repairPoints: json['repair_points'],
      clanTag: json['clan_tag'],
    );
  }
}

class AccessionForm {
  final DateTime timeJoin;
  final String playerTag;
  final String clanTag;
  final bool relevant;
  const AccessionForm(
      {this.timeJoin, this.playerTag, this.clanTag, this.relevant});
  factory AccessionForm.blank() {
    return AccessionForm();
  }
  factory AccessionForm.fromJson(Map<String, dynamic> json) {
    return AccessionForm(
        timeJoin: json['time_join'],
        playerTag: json['player_tag'],
        clanTag: json['clan_tag'],
        relevant: json['relevant']);
  }
}

class PlayerForm {
  final String playerTag;
  final String name;
  final String clanTag;
  final DateTime lastUpdated;
  final int active;
  final int trophies;
  final int bestTrophies;
  //fame: List[FameForm]
  const PlayerForm(
      {this.playerTag,
      this.name,
      this.clanTag,
      this.lastUpdated,
      this.active,
      this.trophies,
      this.bestTrophies});
  factory PlayerForm.blank() {
    return PlayerForm();
  }
  factory PlayerForm.fromJson(Map<String, dynamic> json) {
    return PlayerForm(
        playerTag: json['player_tag'],
        name: json['name'],
        clanTag: json['clan_tag'],
        lastUpdated: json['last_updated'],
        active: json['active'],
        trophies: json['trophies'],
        bestTrophies: json['best_trophies']);
  }
}

class ClanForm {
  final String clanTag;
  final String name;
  final DateTime lastUpdated;
  final DateTime startTracking;

  final List<AccessionForm> accessionsHistory;
  final List<PlayerForm> playersHistory;

  const ClanForm(
      {this.clanTag,
      this.name,
      this.lastUpdated,
      this.startTracking,
      this.accessionsHistory,
      this.playersHistory});

  factory ClanForm.blank() {
    return ClanForm();
  }

  factory ClanForm.fromJson(Map<String, dynamic> json) {
    return ClanForm(
        clanTag: json['clan_tag'],
        name: json['name'],
        lastUpdated: json['last_updated'],
        startTracking: json['start_tracking'],
        accessionsHistory: [
          for (var js in json['accessions_history']) AccessionForm.fromJson(js)
        ],
        playersHistory: [
          for (var js in json['players_history']) PlayerForm.fromJson(js)
        ]);
  }
}

class ClanModel {
  final _clanDataController = StreamController<ApiClanData>.broadcast();
  final _clanFormController = StreamController<ClanForm>.broadcast();
  Stream get stream => _clanDataController.stream;
  ApiClanData apiClanData = ApiClanData.blank();
  ClanForm clanForm = ClanForm.blank();

  updateApiClanData(ApiClanData clanData) {
    apiClanData = clanData;
    _clanDataController.sink.add(apiClanData);
  }

  updateClanForm(ClanForm clanForm) {
    this.clanForm = clanForm;
  }

  dispose() {
    _clanDataController.close();
    _clanFormController.close();
  }
}
