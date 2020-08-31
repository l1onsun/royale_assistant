import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PlayerInfo extends StatelessWidget {
  String player_name = "Unknown player";
  String trophees = "????";

  void _get_player_info() async {
    print("_get_player_info");
    var prefs = await SharedPreferences.getInstance();
    String player_tag = prefs.getString("nickname");
    String url = "https://proxy.royaleapi.dev/v1/players/%23" + player_tag;
    var response = await http.get(url, headers: {
      "User-Agent": "Mozilla/5.0",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImEwYjI1ZjU2LTI3ZDEtNDI5My05ZDliLWIwM2Q0Y2U2NjIxYSIsImlhdCI6MTU4ODQzNjExMywic3ViIjoiZGV2ZWxvcGVyL2U0OGMyOWRhLTU3YWMtYWM5NC1hNDc1LTU3NDg0MjhiZmIyOSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxMjguMTI4LjEyOC4xMjgiXSwidHlwZSI6ImNsaWVudCJ9XX0.2yMe0PVOUBfQBZNOY27XKbkD1rMmVMHK4_zesaSDXaD9jyF7Ec8nF1J3tmRzL4wyCHlZCIlVzO_EIyUGhP0Zng"
    });
    print("response.body!!!:");
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    _get_player_info();

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [Text("Abra"), Text("Cadabra"), Text("Booms")],
        ),
      ),
    );
  }
}
