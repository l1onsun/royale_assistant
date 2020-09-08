import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/view/infos.dart';
import 'package:royale_flutter/data_managment/data_model.dart';

class PlayerInfoRoute extends StatefulWidget {
  @override
  _PlayerInfoRouteState createState() => _PlayerInfoRouteState();
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PlayerInfoRouteState extends State<PlayerInfoRoute>
    with AutomaticKeepAliveClientMixin<PlayerInfoRoute> {
  @override
  bool get wantKeepAlive => true;
  AnimationController _animationController;
  CircularProgressIndicator circularProgressIndicator;

  @override
  void initState() {
    print("init State _PlayerInfoBodyState");
    super.initState();
  }

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
          title: Consumer<PlayerData>(
            builder: (context, player, child) => Text(
              player.name + ": " + player.trophies.toString(),
              //style: TextStyle(fontFamily: "nunito"),
            ),
          ),
          background: Image(
            image: AssetImage('assets/background_one.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment
                .bottomCenter, //Alignment.lerp(Alignment.bottomCenter, Alignment.topCenter, 0.4),
          ),
        ),
      ),
      SliverList(
        //itemExtent: 200.0,
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return InfoBase(children: [
              InfoHeader(text: 'List Item $index'),
              InfoLoading(_animationController),
            ]);
            // return Container(
            //   alignment: Alignment.center,
            //   color: Colors.lightBlue[100 * (index % 9)],
            //   child: Text('List Item $index'),
            // );
          },
        ),
      ),
    ]);

    // return SingleChildScrollView(
    //   child: Center(
    //     child: Column(
    //       children: [Text("Abra"), Text("Cadabra"), Text("Booms")],
    //     ),
    //   ),
    // );
  }
}
