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

// class _UrlPathEnd<T> extends _UrlPath {
//   const _UrlPathEnd(String url, Map<String, String> headers)
//       : super(url, headers);

//   const _UrlPathEnd.fromUrlPath(_UrlPath urlPath) : super(urlPath.url, urlPath.headers) {
//     //return _UrlPathEnd(urlPath.url, urlPath.headers);
//   }
//   factory _UrlPathEnd.add(_UrlPath parrent, String addUrl) {
//     return _UrlPathEnd.fromUrlPath(_UrlPath.add(parrent, addUrl));
//   }

//   Future<T> _get(T fromJson(Map<String, String> json), {String tag}) async {
//     var url;
//     if (tag != null)
//       url = this.url.appendTag(tag);
//     else
//       url = this.url;

//     final response = await http.get(url, headers: headers);
//     if (response.statusCode == 200)
//       return fromJson(json.decode(response.body));
//     else
//       throw Exception('Failed to getPlayer' + tag);
//   }
// }
