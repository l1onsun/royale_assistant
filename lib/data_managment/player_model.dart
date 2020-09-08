import 'dart:async';

class PlayerClanData {}

class PlayerArenaData {}

class PlayerLeagueData {}

class PlayerCardsData {}

class PlayerFavoriteData {}

class PlayerBadgesData {}

class PlayerAchievementsData {}

class PlayerDeckData {}

class PlayerData {
  String tag;
  String name;
  int expLevel;
  int trophies;
  int bestTrophies;
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

  PlayerData(
      {this.tag, this.bestTrophies, this.expLevel, this.name, this.trophies});

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(
        tag: json["tag"],
        bestTrophies: json["bestTrophies"],
        expLevel: json["expLevel"],
        name: json["name"],
        trophies: json["trophies"]);
  }
}

// class PlayerVital {
//   String tag;
//   String name;
//   int expLevel;
//   int trophies;

//   PlayerVital.fromJson();
//   PlayerVital.fromPlayerData();
// }

class PlayerModel {
  final playerTag;
  PlayerModel(this.playerTag);

  final _playerDataController = StreamController<PlayerData>();
  Stream get steam => _playerDataController.stream;
  Sink get sink => _playerDataController.sink;

  dispose() {
    _playerDataController.close();
  }
}
