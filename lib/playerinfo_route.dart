import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:royale_flutter/infos.dart';
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
        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.directions_car),
            onPressed: () {
              Provider.of<DataModel>(context, listen: false).playerName =
                  "directions_car";
            },
          ),
          // action button
          IconButton(
            icon: Icon(Icons.account_balance),
            onPressed: () {
              Provider.of<DataModel>(context, listen: false).playerName =
                  "account_balance  ";
            },
          ),
          // overflow menu
          PopupMenuButton<WhyFarther>(
            onSelected: (WhyFarther wf) {
              Clipboard.getData('text/plain').then((ClipboardData data) {
                String newName = data.text + wf.toString();
                Provider.of<DataModel>(context, listen: false).playerName =
                    newName;
                //Provider.of<DataModel>(context, listen: false)
                //    .notifyListeners();
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.harder,
                child: Text('Working a lot harder'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.smarter,
                child: Text('Being a lot smarter'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.selfStarter,
                child: Text('Being a self-starter'),
              ),
              const PopupMenuItem<WhyFarther>(
                value: WhyFarther.tradingCharter,
                child: Text('Placed in charge of trading charter'),
              ),
            ],
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Consumer<DataModel>(
            builder: (context, dataModel, child) => Text(dataModel.playerName),
          ),
          background: Image(
            image: AssetImage('assets/background_one.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.lerp(
                Alignment.bottomCenter, Alignment.topCenter, 0.4),
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
