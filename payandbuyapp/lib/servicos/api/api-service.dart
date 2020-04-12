import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final String api = 'http://192.168.15.13:3000';

  get(String url, Map query) async {
    var response =
        await http.get(api + url, headers: {'Accept': 'application/json'});

    if (response != null && response.body.isNotEmpty)
      return json.decode(response.body);
  }

  post(String url, Map body) async {
    var response = await http.post(api + url,
        body: json.encode(body), headers: {'Accept': 'application/json'});

    return response;
  }

  put(String url, Map body) async {
    var response = await http.put(_getApiUrl(url),
        body: jsonEncode(body), headers: obterHeaders());

    if (response != null && response.body.isNotEmpty)
      return json.decode(response.body);
  }

  delete(String url, Map body) async {
    var response = await http.delete(api + url, headers: obterHeaders());

    if (response != null && response.body.isNotEmpty)
      return json.decode(response.body);
  }

  // getSessionPagSeguro() async {
  //   const token =
  //       "c6f80841-0482-4ed0-aa90-47ea1cf82f3189f826434cf98ca61d542c7848939a28766c-7169-45c4-99ea-86e9805fdd2b";
  //   const email = "Ideallseg.vendas@gmail.com";

  //   var session = await client.post(
  //       'https://ws.pagseguro.uol.com.br/v2/sessions?email=$email&token=$token',
  //       headers: {'Content-Type': 'application/xml;charset=ISO-8859-1'});

  //   var teste = session.body
  //       .replaceAll(
  //           '<?xml version="1.0" encoding="ISO-8859-1" standalone="yes"?><session><id>',
  //           '')
  //       .replaceAll('</id></session>', '');

  //   return teste;
  // }

  obterHeaders() {
    return {'Accept': 'application/json'};
  }

  // _getUrlQuery(Map query) {
  //   var queryUrl = '';

  //   for (var item in query.keys) {
  //     if (item == null) continue;

  //     if (queryUrl.indexOf('?') < 0)
  //       queryUrl += '?';
  //     else
  //       queryUrl += '&';

  //     queryUrl += item + '=' + query[item].toString();
  //   }

  //   return queryUrl;
  // }

  String _getApiUrl(String url) {
    return Uri.decodeFull(Uri.http(api, url).toString());
  }
}
