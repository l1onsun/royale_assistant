import 'package:http/http.dart' as realhttp;

class FakeResponse extends realhttp.Response {
  FakeResponse(String body, int statusCode) : super(body, statusCode);
  FakeResponse.player() : super("", 202);
}
