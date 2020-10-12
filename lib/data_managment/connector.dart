import 'dart:async';

import 'package:royale_flutter/data_managment/api/api_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Connector {
  WebSocketChannel _channel;
  final _inputController = StreamController();
  Stream get output => _channel.stream;
  Sink get input => _inputController.sink;

  init() async {
    _connectWebsocket();
  }

  _connectWebsocket() async {
    try {
      _channel = Api.ws.emulator.websocket.channel();
      await for (var value in _channel.stream) {
        // change
      }
    } catch (e) {
      return;
    } finally {
      reconnectWebsocket();
    }
  }

  reconnectWebsocket() {
    _connectWebsocket();
  }

  dispose() {
    _inputController.close();
  }
}
