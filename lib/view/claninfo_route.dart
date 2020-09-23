import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';

import 'cards/infos.dart';

class ClanInfoRoute extends StatefulWidget {
  @override
  _ClanInfoRouteState createState() => _ClanInfoRouteState();
}

class _ClanInfoRouteState extends State<ClanInfoRoute> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title: Selector<ClanData, List>(
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
