import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/custom-alert.dart';

class Api {
  final String api = '192.168.15.13:3000';
  Dio dio = new Dio();

  list(String url, Map query) async {
    url += getUrlQuery(query);

    try {
      var response = await dio.get(getApiUrl(url),
          options: Options(headers: obterHeaders()));

      if (response != null && response.data.isNotEmpty) return response.data;
    } catch (e) {
      if (e.response.data != null)
        Modular.to.showDialog(
            child: CustomAlert(
                msg: e.response.data, titulo: 'Ops, ocorreu um erro'));
      else
        Modular.to.pushReplacementNamed('/sem-conexao');
    }
  }

  get(String url, String query) async {
    try {
      var response = await dio.get(getApiUrl(url) + query,
          options: Options(headers: obterHeaders()));

      if (response != null && response.data.isNotEmpty) return response.data;
    } catch (e) {
      if (e.response.data != null)
        Modular.to.showDialog(
            child: CustomAlert(
                msg: e.response.data, titulo: 'Ops, ocorreu um erro'));
      else
        Modular.to.pushReplacementNamed('/sem-conexao');
    }
  }

  post(String url, Map body) async {
    try {
      var response = await dio.post(getApiUrl(url), data: body);

      if (response != null) return response;
    } catch (e) {
      if (e.response.data != null)
        Modular.to.showDialog(
            child: CustomAlert(
                msg: e.response.data, titulo: 'Ops, ocorreu um erro'));
      else
        Modular.to.pushReplacementNamed('/sem-conexao');
    }
  }

  put(String url, Map body, String id) async {
    try {
      var urlFinal = getApiUrl(url) + id;

      var response = await dio.put(urlFinal,
          data: body, options: Options(headers: obterHeaders()));

      if (response != null && response.data.isNotEmpty) return response.data;
    } catch (e) {
      if (e.response.data != null)
        Modular.to.showDialog(
            child: CustomAlert(
                msg: e.response.data, titulo: 'Ops, ocorreu um erro'));
      else
        Modular.to.pushReplacementNamed('/sem-conexao');
    }
  }

  delete(String url, String id) async {
    try {
      var urlFinal = getApiUrl(url) + id;

      var response =
          await dio.delete(urlFinal, options: Options(headers: obterHeaders()));

      if (response != null && response.data.isNotEmpty) return response.data;
    } catch (e) {
      if (e.response.data != null)
        Modular.to.showDialog(
            child: CustomAlert(
                msg: e.response.data, titulo: 'Ops, ocorreu um erro'));
      else
        Modular.to.pushReplacementNamed('/sem-conexao');
    }
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

  getUrlQuery(Map query) {
    var queryUrl = '';

    for (var item in query.keys) {
      if (item == null) continue;

      // if (queryUrl.indexOf('?') < 0)
      //   queryUrl += '?';
      // else
      //   queryUrl += '&';

      queryUrl += item + '=' + query[item].toString();
    }

    return queryUrl;
  }

  obterHeaders() {
    return {'Accept': 'application/json'};
  }

  String getApiUrl(String url) {
    return Uri.encodeFull(Uri.http(api, url).toString());
  }
}
