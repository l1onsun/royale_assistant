import 'package:flutter_test/flutter_test.dart';
import 'package:royale_flutter/data_managment/api_manager.dart';

main() {
  ApiManager().getPlayer("#89R2CQ9J0").then((player) {
    expect(player.name, "lionson");
  });
}
