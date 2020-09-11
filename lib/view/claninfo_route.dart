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
          title: Selector<ClanData, String>(
              selector: (_, clan) => clan.name,
              builder: (_, clanName, __) => Text(clanName ?? "HOW!!!!")),
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
