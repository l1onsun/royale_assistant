import 'player_model.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  final String url;
  final Map<String, String> headers;
  const ApiRequest({this.url, this.headers});

  get() {
    return http.get(url, headers: headers);
  }
}

class ApiRequests {
  ApiRequests._();
  static const player =
      ApiRequest(url: "https://proxy.royaleapi.dev/v1/player/%23", headers: {
    "User-Agent": "Mozilla/5.0",
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImEwYjI1ZjU2LTI3ZDEtNDI5My05ZDliLWIwM2Q0Y2U2NjIxYSIsImlhdCI6MTU4ODQzNjExMywic3ViIjoiZGV2ZWxvcGVyL2U0OGMyOWRhLTU3YWMtYWM5NC1hNDc1LTU3NDg0MjhiZmIyOSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxMjguMTI4LjEyOC4xMjgiXSwidHlwZSI6ImNsaWVudCJ9XX0.2yMe0PVOUBfQBZNOY27XKbkD1rMmVMHK4_zesaSDXaD9jyF7Ec8nF1J3tmRzL4wyCHlZCIlVzO_EIyUGhP0Zng"
  });
}

class ApiManager {
  PlayerApi getPlayer(String tag) async {
    ApiRequests.
  }
}
