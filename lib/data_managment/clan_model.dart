import 'dart:async';

import 'api/api_manager.dart';

class ClanData {
  final String tag;
  final String name;
  final int badgeId;
  //"badgeUrls"

  const ClanData({this.tag, this.name, this.badgeId});
  const ClanData.blank()
      : tag = "#xxxxxxxx",
        name = "Clan Name",
        badgeId = 16000072; //TODO: // fix
  factory ClanData.fromJson(json) {
    print("What is badgeUrls ???");
    print(json["badgeUrls"]);
    print(json["badgeId"]);
    return ClanData(tag: json["tag"], name: json["name"]);
  }
}

class ClanModel {
  final _clanDataController = StreamController<ClanData>.broadcast();
  Stream get stream => _clanDataController.stream;
  ClanData clan = ClanData.blank();

  updateClanData(ClanData clanData) {
    clan = clanData;
    _clanDataController.sink.add(clan);
  }

  dispose() {
    _clanDataController.close();
  }
}
