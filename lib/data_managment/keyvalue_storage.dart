import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorage {
  SharedPreferences repository;
  bool inited = false;

  init() async {
    repository = await SharedPreferences.getInstance();
    inited = true;
  }
}
