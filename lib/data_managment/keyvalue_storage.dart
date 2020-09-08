import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorage {
  SharedPreferences repository;

  init() async {
    repository = await SharedPreferences.getInstance();
  }

  String get currentPlayerTag {
    const String currentPlayer = "currentPlayer";
    if (repository.containsKey(currentPlayer))
      return repository.getString(currentPlayer);
    else {
      // TODO: implement WelocmDialog if player not found
      return "#89R2CQ9J0"; // my #Tag
    }
  }
}
