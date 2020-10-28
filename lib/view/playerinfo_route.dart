import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/view/cards/infos.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:royale_flutter/view/cards/player/general_player_info.dart';

StreamProvider<PlayerData> createPlayerRoute(
    BuildContext context, String playerTag) {
  final playerModel =
      Provider.of<DataModel>(context, listen: false).playerModel(playerTag);
  return StreamProvider<PlayerData>.value(
      initialData: playerModel.player,
      value: playerModel.stream,
      builder: (_, __) => PlayerInfoRoute());
}

void pushPlayerRoute(BuildContext context, String playerTag) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return createPlayerRoute(context, playerTag);
  }));
}

class PlayerInfoRoute extends StatefulWidget {
  @override
  _PlayerInfoRouteState createState() => _PlayerInfoRouteState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayerInfoRouteState extends State<PlayerInfoRoute>
    with AutomaticKeepAliveClientMixin<PlayerInfoRoute> {
  @override
  bool get wantKeepAlive => true;
  //AnimationController _animationController;
  CircularProgressIndicator circularProgressIndicator;

  @override
  Widget build(BuildContext context) {
    print("PlayerInfoBody build");
    return CustomScrollView(slivers: [
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        textTheme: Theme.of(context).textTheme,
        actions: [
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther wf) {
              // Clipboard.getData('text/plain').then((ClipboardData data) {
              //   String newName = data.text + wf.toString();
              //   Provider.of<DataModel>(context, listen: false).playerName =
              //       newName;
              //   //Provider.of<DataModel>(context, listen: false)
              //   //    .notifyListeners();
              // });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child: Row(children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  Text(' Settings')
                ]),
              )
            ],
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          title: Selector<PlayerData, Map>(
              selector: (_, player) =>
                  {"name": player.name, "lvl": player.expLevel},
              builder: (_, player, __) =>
                  PlayerTitle(player["lvl"], player["name"])),
          background: Image(
            image: AssetImage('assets/background_one.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment
                .bottomCenter, //Alignment.lerp(Alignment.bottomCenter, Alignment.topCenter, 0.4),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          GeneralPlayerInfo(),
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

class PlayerTitle extends StatelessWidget {
  final String name;
  final int lvl;
  PlayerTitle(this.lvl, this.name);
  @override
  Widget build(BuildContext context) {
    print("Level: " + lvl.toString());
    return Row(children: [
      Image.asset(
        "assets/icons/lvls/" + lvl.toString() + '.png',
        scale: 10,
      ), // + lvl.toString() + '.png'),
      Text(" " + name)
    ]);
  }
}
