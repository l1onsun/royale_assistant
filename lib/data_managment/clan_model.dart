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
  final clanTag;
  bool autoUpdate = true;

  final _clanDataController = StreamController<ClanData>.broadcast();
  Stream get steam => _clanDataController.stream;
  Sink get sink => _clanDataController.sink;
  ClanData clan = ClanData.blank();

  _update() async {
    clan = await Api.https.proxyApi.clans.get(clanTag);
    sink.add(clan);
  }

  _autoUpdate() async {
    _update();
    Future.delayed(Duration(minutes: 2), _autoUpdate);
  }

  ClanModel(this.clanTag, {this.autoUpdate}) {
    _autoUpdate();
  }

  dispose() {
    _clanDataController.close();
  }
}
