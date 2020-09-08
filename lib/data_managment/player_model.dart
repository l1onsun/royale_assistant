import 'dart:async';

import 'package:royale_flutter/data_managment/data_model.dart';
import 'api/api_manager.dart';

class PlayerClanData {}

class PlayerArenaData {}

class PlayerLeagueData {}

class PlayerCardsData {}

class PlayerFavoriteData {}

class PlayerBadgesData {}

class PlayerAchievementsData {}

class PlayerDeckData {}

class PlayerData {
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

  // PlayerClanData clan;
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

  const PlayerData(
      {this.tag, this.bestTrophies, this.expLevel, this.name, this.trophies});

  const PlayerData.blank()
      : tag = "#xxxxxxxx",
        bestTrophies = 9999,
        name = "Noname",
        this.expLevel = 13,
        trophies = 9999;

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
        tag: json["tag"],
        bestTrophies: json["bestTrophies"],
        expLevel: json["expLevel"],
        name: json["name"],
        trophies: json["trophies"]);
  }
}

class PlayerModel {
  final playerTag;
  bool autoUpdate = true;
  _autoUpdate() async {
    PlayerData player = await Api.https.proxyApi.players.get(playerTag);
    sink.add(player);

    Future.delayed(Duration(seconds: 20), _autoUpdate);
  }

  PlayerModel(this.playerTag, {this.autoUpdate}) {
    _autoUpdate();
  }

  final _playerDataController = StreamController<PlayerData>();
  Stream get steam => _playerDataController.stream;
  Sink get sink => _playerDataController.sink;

  dispose() {
    _playerDataController.close();
  }
}
