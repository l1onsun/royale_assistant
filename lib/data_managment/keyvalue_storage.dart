//import 'dart:html';

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

  dynamic get(String key) {
    return preferences.get(key);
  }

  put(String key, dynamic value) {
    preferences.put(key, value);
  }

  // String get currentPlayerTag {
  //   return preferences.get("currentPlayerTag");
  // }

  // set currentPlayerTag(String tag) {
  //   preferences.put("currentPlayerTag", tag);
  // }

  // bool get welcome {
  //   return preferences.get("welcome") == true;
  // }

  // set welcome(bool flag) {
  //   preferences.put("welcome", flag);
  // }
}
