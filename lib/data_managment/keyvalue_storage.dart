import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class KeyValueStorage {
  Box preferences;
  Box clan;
  Box player;

  init() async {
    // repository = await SharedPreferences.getInstance();
    await Hive.initFlutter();
    preferences = await Hive.openBox('preferences');
  }

  String get currentPlayerTag {
    // const String currentPlayer = "currentPlayer";
    // if (preferences.containsKey(currentPlayer))
    //   return preferences.get(currentPlayer);
    // else {
    //   return null;

    return preferences.get("currentPlayerTag");
    // TODO: implement WelocmDialog if player not found
    // return "#89R2CQ9J0"; // my #Tag
  }
}
