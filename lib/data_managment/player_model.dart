import 'dart:async';

class PlayerData {}

class PlayerModel {
  final playerTag;
  PlayerModel(this.playerTag);
  StreamController<PlayerData> _playerDataController;
  Stream get steam => _playerDataController.stream;
  Sink get sink => _playerDataController.sink;

  dispose() {
    _playerDataController.close();
  }
}
