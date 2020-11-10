import 'dart:async';
import 'package:royale_flutter/logging.dart';

import 'dart:convert';
import 'dart:math';
import 'package:royale_flutter/data_managment/api/api_manager.dart';
import 'package:royale_flutter/data_managment/data_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const logger = Logger("connector");

class Connector {
  WebSocketChannel _connection;

  final _outputController = StreamController.broadcast();
  final _random = new Random();

  DataModel _dataModel;

  init(DataModel dataModel) {
    _dataModel = dataModel;
    print("init connector");
    _connectWebsocket();
  }

  activate(String playerTag, int activeChange) {
    sendRequest(_activateRequest(playerTag, activeChange));
  }

  String _activateRequest(String playerTag, int activeChange) {
    final response = Map<String, dynamic>();
    response['type'] = 'activate';
    response['player_tag'] = playerTag;
    response['active_change'] = activeChange;
    return jsonEncode(response);
  }

  sendRequest(String request) {
    logger.info("sendRequest", error: request);
    _connection.sink.add(request);
  }

  _handleResponse(String value) {
    Map<String, dynamic> info = jsonDecode(value);
    switch (info['type']) {
      case "init":
        {
          logger.info("handling init response");
          logger.debug(info.toString()); //ToDo
        }
        break;
      case "proxy":
        {
          logger.info("handling proxy response");
          if (info['player'] != null)
            _dataModel.updateApiPlayer(jsonDecode(info['player']));
          if (info['clan'] != null)
            _dataModel.updateApiClan(jsonDecode(info['clan']));
          if (info['river'] != null)
            _dataModel.updateApiRiver(jsonDecode(info['river']));
        }
        break;
      case "player":
        {
          logger.info("handling player response");
          // _dataModel.updatePlayerFromJson(info); // TODO
        }
        break;
      case "clan":
        {
          logger.info("handling clan form response");
          _dataModel.updateClanForm(info); //TODO
          logger.info("success!");
        }
        break;
    }
  }

  _connectWebsocket() async {
    assert(_connection == null);
    while (true) {
      logger.info("connecting to ws");
      try {
        _connection = Api.ws.emulator.websocket.channel();
        await for (var response in _connection.stream) {
          logger.info("Get response", error: response);
          // print("response");
          // print(response);
          _handleResponse(response);
        }
        logger.error("websocket stream closed");
      } on WebSocketChannelException catch (e) {
        logger.exception("websocket connection refused", error: e);
      } catch (e, stackTrace) {
        logger.exception("unknown exception while response handling",
            error: e, stackTrace: stackTrace);
      } finally {
        _connection?.sink?.close();
      }
      int reconnectTime = 4 + _random.nextInt(10);
      logger.error(
          "webscoket reconnect in " + reconnectTime.toString() + " seconds");
      await Future.delayed(Duration(seconds: reconnectTime));
    }
  }

  dispose() {
    _outputController.close();
  }
}
