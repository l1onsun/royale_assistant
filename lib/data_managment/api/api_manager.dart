import 'dart:convert';

import 'package:royale_flutter/data_managment/clan_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../player_model.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

part 'urlpath.dart';

class _ProxyApiPlayersPath extends _UrlPath {
  final url = "/players";
  const _ProxyApiPlayersPath(_UrlPath ancestor) : super(ancestor: ancestor);

  Future<PlayerData> get(String tag) {
    return super._get((json) {
      return PlayerData.fromJson(json);
    }, tag);
  }
}

class _ProxyApiClansPath extends _UrlPath {
  final url = "/clans";
  const _ProxyApiClansPath(_UrlPath ancestor) : super(ancestor: ancestor);

  Future<ApiClanData> get(String tag) {
    return super._get((json) {
      return ApiClanData.fromJson(json);
    }, tag);
  }
}

class _ProxyApiPath extends _UrlPath {
  final url = "/proxy.royaleapi.dev/v1";
  final headers = const {
    "User-Agent": "Mozilla/5.0",
    "Authorization":
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImEwYjI1ZjU2LTI3ZDEtNDI5My05ZDliLWIwM2Q0Y2U2NjIxYSIsImlhdCI6MTU4ODQzNjExMywic3ViIjoiZGV2ZWxvcGVyL2U0OGMyOWRhLTU3YWMtYWM5NC1hNDc1LTU3NDg0MjhiZmIyOSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIxMjguMTI4LjEyOC4xMjgiXSwidHlwZSI6ImNsaWVudCJ9XX0.2yMe0PVOUBfQBZNOY27XKbkD1rMmVMHK4_zesaSDXaD9jyF7Ec8nF1J3tmRzL4wyCHlZCIlVzO_EIyUGhP0Zng"
  };
  const _ProxyApiPath(_UrlPath ancestor) : super(ancestor: ancestor);

  static const _players = _ProxyApiPlayersPath(_HttpsPath._proxyApi);
  _ProxyApiPlayersPath get players => _ProxyApiPath._players;

  static const _clans = _ProxyApiClansPath(_HttpsPath._proxyApi);
  _ProxyApiClansPath get clans => _ProxyApiPath._clans;
}

class _HttpsPath extends _UrlPath {
  final url = "https:/";
  final headers = const {};
  const _HttpsPath();

  static const _proxyApi = _ProxyApiPath(Api.https);
  _ProxyApiPath get proxyApi => _HttpsPath._proxyApi;
}

class _WebsocketPath extends _UrlPath {
  final url = "/ws";
  const _WebsocketPath() : super(ancestor: _WSPath._emulator);

  WebSocketChannel channel() {
    return _channel();
  }
}

class _EmulatorPath extends _UrlPath {
  final url = "/10.0.2.2:8000";
  const _EmulatorPath() : super(ancestor: Api.ws);

  static const _websocket = _WebsocketPath();
  _WebsocketPath get websocket => _EmulatorPath._websocket;
}

class _WSPath extends _UrlPath {
  final url = "ws:/";
  final headers = const {};
  const _WSPath();

  static const _emulator = _EmulatorPath();
  _EmulatorPath get emulator => _WSPath._emulator;
}

class Api {
  static const https = _HttpsPath();
  static const ws = _WSPath();
}
