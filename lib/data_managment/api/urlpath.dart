part of 'api_manager.dart';

extension on String {
  String fixTag(String tag) {
    return this + "/%23" + tag.substring(1);
  }
}

class _UrlPath {
  final String url = "";
  final Map<String, String> headers = null;
  final _UrlPath ancestor;

  const _UrlPath({this.ancestor});

  String _fullUrl() {
    String fullUrl = "";
    for (_UrlPath i = this; i != null; i = i.ancestor) {
      fullUrl = i.url + fullUrl;
    }
    return fullUrl;
  }

  Map<String, String> test_lastHeader() => _lastHeader();
  Map<String, String> _lastHeader() {
    var lastHeader = {};
    for (_UrlPath i = this; i != null; i = i.ancestor) {
      if (i.headers != null) {
        lastHeader = i.headers;
        break;
      }
    }
    return lastHeader;
  }

  String test_fullUrlTag(String tag) => _fullUrlTag(tag);
  String _fullUrlTag(String tag) => _fullUrl().fixTag(tag);

  Future<T> _get<T>(T fromJson(Map<String, dynamic> json), String tag) async {
    final response = await http.get(_fullUrlTag(tag), headers: _lastHeader());
    if (response.statusCode == 200)
      return fromJson(json.decode(response.body));
    else
      throw Exception('Failed to _get<' +
          T.toString() +
          '>(' +
          tag +
          ")" +
          "\nurl: " +
          _fullUrlTag(tag) +
          "\nStatusCode: " +
          response.statusCode.toString() +
          "\nheadres: " +
          _lastHeader().toString());
  }
}
