import 'dart:async';

class PlayerClanApi {}

class PlayerArenaApi {}

class PlayerLeagueApi {}

class PlayerCardsApi {}

class PlayerFavoriteApi {}

class PlayerBadgesApi {}

class PlayerAchievementsApi {}

class PlayerDeckApi {}

class PlayerApi {
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
  // PlayerDeckApi currentDeck;
  // int warDayWins;
  // int clanCardsCollected;
  // int starPoints;

  // PlayerClanApi clan;
  // PlayerArenaApi arena;
  // String role;
  // int wins;
  // int losses;
  // int totalDonations;
  // PlayerLeagueApi leagueStatistics;
  // PlayerCardsApi cards;
  // PlayerFavoriteApi currentFavouriteCard;
  // PlayerBadgesApi badges;
  // PlayerAchievementsApi achievements;

  PlayerApi(
      {this.tag, this.bestTrophies, this.expLevel, this.name, this.trophies});

  factory PlayerApi.fromJson(Map<String, dynamic> json) {
    return PlayerApi(
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
//   PlayerVital.fromPlayerApi();
// }

class PlayerModel {
  final playerTag;
  PlayerModel(this.playerTag);

  final _playerApiController = StreamController<PlayerApi>();
  Stream get steam => _playerApiController.stream;
  Sink get sink => _playerApiController.sink;

  dispose() {
    _playerApiController.close();
  }
}
