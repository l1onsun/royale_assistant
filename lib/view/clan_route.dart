import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';

import 'info/infos.dart';

Selector<DataModel, ClanModel> createClanRoute(String clanTag) {
  return Selector<DataModel, ClanModel>(
      selector: (_, dataModel) => dataModel.clanModel(clanTag),
      builder: (_, clanModel, __) => StreamProvider<ApiClanData>.value(
          initialData: clanModel.apiClanData,
          value: clanModel.stream,
          builder: (_, __) => ClanRoute()));
}

void pushClanRoute(BuildContext context, String clanTag) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return createClanRoute(clanTag);
  }));
}

class ClanRoute extends StatefulWidget {
  @override
  _ClanRouteState createState() => _ClanRouteState();
}

class _ClanRouteState extends State<ClanRoute> {
  @override
  Widget build(BuildContext context) {
    print("ClanRoute build");
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title: Selector<ApiClanData, List>(
              selector: (_, clan) => [clan.name, clan.badgeId],
              builder: (_, clan, __) => Row(children: [
                    if (clan[1] != null)
                      Image.network(
                            "https://cdn.statsroyale.com/images/badges/" +
                                clan[1].toString() +
                                ".png",
                            scale: 5,
                          ) ??
                          Text("No Image.. "),
                    Text(clan[0])
                  ])),
          background: Image(
            image: AssetImage('assets/background_two.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment
                .bottomCenter, //Alignment.lerp(Alignment.bottomCenter, Alignment.topCenter, 0.4),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          //GeneralPlayerInfo(),
          InfoBase(children: [
            InfoHeader(text: 'List Item One'),
            InfoLoading(),
          ]),
          InfoBase(children: [
            InfoHeader(text: 'List Item Two'),
            InfoLoading(),
          ]),
        ]),
      ),
    ]);
  }
}
