import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royale_flutter/data_managment/player_model.dart';
import 'package:royale_flutter/view/info/infos.dart';

class TrophyInfoAtom extends StatelessWidget {
  final int trophies;
  final String text;
  TrophyInfoAtom(this.text, this.trophies);

  @override
  Widget build(BuildContext context) {
    return InfoAtom(
      leftImage: Image.asset(
        "assets/icons/trophy.png",
        scale: 5,
      ),
      leftText: text,
      rightText: trophies.toString(),
    );
  }
}

class GeneralPlayerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InfoBase(children: [
      Selector<PlayerData, List>(
        builder: (_, name, __) => InfoHeader(
          icon: Icons.person,
          text: name[0],
          additionalText: name[1],
        ),
        selector: (_, player) => [player.name, player.tag],
      ),
      Table(
          //border: TableBorder.all(),
          children: [
            TableRow(children: [
              Selector<PlayerData, int>(
                  selector: (_, player) => player.bestTrophies,
                  builder: (_, maxTrophies, __) =>
                      TrophyInfoAtom("  Best: ", maxTrophies)),
              Selector<PlayerData, int>(
                  selector: (_, player) => player.trophies,
                  builder: (_, maxTrophies, __) =>
                      TrophyInfoAtom("  Current: ", maxTrophies)),
            ]),
          ]),
      // Selector<PlayerData, PlayerClanData>(
      //     selector: (_, player) => player.clan,
      //     builder: (context, clan, __) => InkWell(
      //         onTap: () {
      //           print("before pushClanRoute");
      //           pushClanRoute(context, clan.tag);
      //         },
      //         child: Row(
      //           children: [
      //             Text("Clan:   ", style: InfoAtom.styleLeft),
      //             Text(clan.name, style: InfoAtom.styleRight)
      //           ],
      //         ))),
      //InfoAtom(leftText: " Clan: ", rightText: clanName)),
      Selector<PlayerData, String>(
          selector: (_, player) => player.clan.tag,
          builder: (_, clanTag, __) =>
              InfoAtom(leftText: "ClanTag: ", rightText: clanTag))
    ]);
  }
}
