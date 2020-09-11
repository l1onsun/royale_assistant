import 'dart:async';

import 'package:royale_flutter/data_managment/data_model.dart';
import 'api/api_manager.dart';

class PlayerClanData {
  //int badgeId: 0,
  final String tag;
  final String name;
  // "badgeUrls": {}
  const PlayerClanData({this.tag, this.name});
  factory PlayerClanData.fromJson(Map<String, dynamic> json) {
    return PlayerClanData(tag: json["tag"], name: json["name"]);
  }
  const PlayerClanData.blank()
      : tag = "#xxxxxxxx",
        name = "Clan unknown";
}

class PlayerArenaData {}

class PlayerLeagueData {}

class PlayerCardsData {}

class PlayerFavoriteData {}

class PlayerBadgesData {}

class PlayerAchievementsData {}

class PlayerDeckData {}

class PlayerData {
  final bool blank;
  final String tag;
  final String name;
  final int expLevel;
  final int trophies;
  final int bestTrophies;
  // int donations;
  // int donationsReceived;
  // int battleCount;
  // int threeCrownWins;
  // int challengeCardsWon;
  // int challengeMaxWins;
  // int tournamentCardsWon;
  // int tournamentBattleCount;
  // PlayerDeckData currentDeck;
  // int warDayWins;
  // int clanCardsCollected;
  // int starPoints;

  final PlayerClanData clan;
  // PlayerArenaData arena;
  // String role;
  // int wins;
  // int losses;
  // int totalDonations;
  // PlayerLeagueData leagueStatistics;
  // PlayerCardsData cards;
  // PlayerFavoriteData currentFavouriteCard;
  // PlayerBadgesData badges;
  // PlayerAchievementsData achievements;

  PlayerData(
      {this.tag,
      this.bestTrophies,
      this.expLevel,
      this.name,
      this.trophies,
      this.clan})
      : blank = false;

  const PlayerData.blank()
      : blank = true,
        tag = "#xxxxxxxx",
        bestTrophies = 9999,
        name = "Player Name",
        this.expLevel = 13,
        trophies = 9999,
        clan = const PlayerClanData.blank();

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
        tag: json["tag"],
        bestTrophies: json["bestTrophies"],
        expLevel: json["expLevel"],
        name: json["name"],
        trophies: json["trophies"],
        clan: PlayerClanData.fromJson(json["clan"]));
  }
}

class PlayerModel {
  final playerTag;
  bool autoUpdate = true;

  final _playerDataController = StreamController<PlayerData>.broadcast();
  Stream get steam => _playerDataController.stream;
  Sink get sink => _playerDataController.sink;
  PlayerData player = PlayerData.blank();

  _update() async {
    player = await Api.https.proxyApi.players.get(playerTag);
    sink.add(player);
  }

  _autoUpdate() async {
    _update();
    Future.delayed(Duration(minutes: 2), _autoUpdate);
  }

  PlayerModel(this.playerTag, {this.autoUpdate}) {
    _autoUpdate();
  }

  dispose() {
    _playerDataController.close();
  }
}
