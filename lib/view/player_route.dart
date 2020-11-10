import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/view/info/infos.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:royale_flutter/view/info/player/player_clan_info.dart';
import 'package:royale_flutter/view/info/player/general_player_info.dart';

Selector<DataModel, PlayerModel> createPlayerRoute(String playerTag) {
  return Selector<DataModel, PlayerModel>(
    selector: (_, dataModel) => dataModel.playerModel(playerTag),
    builder: (_, playerModel, __) => StreamProvider<PlayerData>.value(
        initialData: playerModel.player,
        value: playerModel.stream,
        builder: (_, __) => PlayerRoute()),
  );
}

void pushPlayerRoute(BuildContext context, String playerTag) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    return createPlayerRoute(playerTag);
  }));
}

class PlayerRoute extends StatefulWidget {
  @override
  _PlayerRouteState createState() => _PlayerRouteState();
}

class _PlayerRouteState extends State<PlayerRoute>
    with AutomaticKeepAliveClientMixin<PlayerRoute> {
  @override
  bool get wantKeepAlive => true;
  //AnimationController _animationController;
  CircularProgressIndicator circularProgressIndicator;

  @override
  Widget build(BuildContext context) {
    print("PlayerInfoBody build");
    return CustomScrollView(slivers: [
      _PlayerAppBar(),
      SliverList(
        delegate: SliverChildListDelegate([
          GeneralPlayerInfo(),
          PlayerClanInfo(),
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

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                _PlayerTitle(player["lvl"], player["name"])),
        background: Image(
          image: AssetImage('assets/background_one.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment
              .bottomCenter, //Alignment.lerp(Alignment.bottomCenter, Alignment.topCenter, 0.4),
        ),
      ),
    );
  }
}

class _PlayerTitle extends StatelessWidget {
  final String name;
  final int lvl;
  _PlayerTitle(this.lvl, this.name);
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
