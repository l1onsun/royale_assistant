import 'data_model.dart';
import 'player_model.dart';

class BlankDataModel implements DataModel {
  Stream<PlayerData> currentPlayerStream() async* {
    // TODO: PlayerData.blank()
    yield PlayerData.blank();
  }

  Stream<PlayerData> playerStream(String tag) async* {
    // TODO: PlayerData.blank()
    yield PlayerData.blank();
  }
}
