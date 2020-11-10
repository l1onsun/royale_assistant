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
}
