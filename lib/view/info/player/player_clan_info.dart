import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/clan_model.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/view/info/infos.dart';

import '../../clan_route.dart';

class PlayerClanInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<PlayerData, PlayerClanData>(
        selector: (context, player) => player.clan,
        builder: (context, clan, child) => InkWell(
            onTap: () {
              print("before pushClanRoute");
              pushClanRoute(context, clan.tag);
            },
            child: InfoBase(
              children: [
                InfoHeader(
                    text: "Clan",
                    additionalText: clan.tag,
                    icon: Icons.people_alt_sharp),
                InfoAtom(
                  leftText: "Clan",
                  leftImage: Image.asset(
                    "assets/icons/trophy.png",
                    scale: 5,
                  ),
                  rightText: clan.name,
                ),
              ],
            )));
  }
}
