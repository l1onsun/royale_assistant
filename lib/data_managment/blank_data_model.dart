import 'clan_model.dart';
import 'data_model.dart';
import 'player_model.dart';

class BlankDataModel implements DataModel {
  Stream<PlayerData> currentPlayerStream() async* {
    // TODO: PlayerData.blank()
    yield PlayerData.blank();
  }

  PlayerData currentPlayerData() {
    return PlayerData.blank();
  }

  Stream<PlayerData> playerStream(String tag) async* {
    // TODO: PlayerData.blank()
    yield PlayerData.blank();
  }

  PlayerData playerData(String tag) {
    return PlayerData.blank();
  }

  Stream<ClanData> clanStream(String tag) async* {
    // TODO: PlayerData.blank()
    yield ClanData.blank();
  }

  ClanData clanData(String tag) {
    return ClanData.blank();
  }
}
