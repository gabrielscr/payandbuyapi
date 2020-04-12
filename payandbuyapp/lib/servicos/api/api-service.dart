import 'package:dio/dio.dart';
import 'dart:convert';

class Api {
  final String api = '192.168.15.13:3000';
  Dio dio = new Dio();

  get(String url, Map query) async {
    var response = await dio.get(getApiUrl(url),
        options: Options(headers: obterHeaders()));

    if (response != null && response.data.isNotEmpty) return response.data;
  }

  post(String url, Map body) async {
    var response = await dio.post(getApiUrl(url), data: body);

    if (response != null) return response;
  }

  put(String url, Map body) async {
    var response = await dio.put(getApiUrl(url),
        data: jsonEncode(body), options: Options(headers: obterHeaders()));

    if (response != null && response.data.isNotEmpty) return response.data;
  }

  delete(String url, Map body) async {
    var response = await dio.delete(getApiUrl(url),
        options: Options(headers: obterHeaders()));

    if (response != null && response.data.isNotEmpty) return response.data;
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

  String getApiUrl(String url) {
    return Uri.encodeFull(Uri.http(api, url).toString());
  }
}
