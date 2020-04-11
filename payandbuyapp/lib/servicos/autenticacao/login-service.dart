import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:payandbuyapp/app/widgets/custom-alert.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  var apiService = Api();
  SharedPreferences sharedPreferences;

  logar(String email, String senha) async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map loginData = {'email': email, 'senha': senha};

    var jsonResponse;

    Response response = await apiService.post('/logar', loginData);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        sharedPreferences.setString("token", jsonResponse['token']);

        Modular.to.pushReplacementNamed('/home');
      }
    } else {
      Modular.to.showDialog(
          child: CustomAlert(
              titulo: "Ocorreu um erro", msg: "Usuário ou senha inválidos"));
    }
  }

  criarConta(String email, String senha) async {
    Map loginData = {'email': email, 'senha': senha};

    var response = await apiService.post('/criarConta', loginData);

    if (response.statusCode == 200) {
      json.decode(response.body);
      Modular.to.showDialog(
          child: CustomAlert(
        titulo: "Obrigado!",
        msg: "Conta criada com sucesso.",
      ));
    } else {
      Modular.to.showDialog(
          child: CustomAlert(
        titulo: "Ocorreu um erro",
        msg: response.body,
      ));
    }
  }

  deslogar() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    Modular.to.pushReplacementNamed('/login');
  }
}
