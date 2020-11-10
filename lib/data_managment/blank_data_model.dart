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

  updateApiPlayer(Map<String, dynamic> json) {
    throw Exception("BlankDataModel trying updateApiPlayer");
  }

  updateApiClan(Map<String, dynamic> json) {
    throw Exception("BlankDataModel trying updateApiClan");
  }

  updateApiRiver(Map<String, dynamic> riverJson) {
    throw Exception("BlankDataModel trying updateApiRiver");
  }

  changeCurrentPlayer(String newTag, [String oldTag]) {
    throw Exception("BlankDataModel trying changeCurrentPlayer");
  }

  updateClanForm(Map<String, dynamic> clanForm) {
    throw Exception("BlankDataModel trying updateClanForm");
  }

  dispose() {
    print("BlankDataModel dispose"); //ToDO
  }
}
