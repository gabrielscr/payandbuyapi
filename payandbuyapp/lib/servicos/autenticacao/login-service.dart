import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/usuario-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-alert.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  var apiService = Api();
  SharedPreferences sharedPreferences;
  var usuarioController = Modular.get<UsuarioController>();

  logar(String email, String senha) async {
    sharedPreferences = await SharedPreferences.getInstance();

    Map loginData = {'email': email, 'senha': senha};

    var response = await apiService.post('/logar', loginData);

    if (response.statusCode == 200) {
      if (response.data != null) {
        sharedPreferences.setString("token", response.data['token']);

        sharedPreferences.setString("userId", response.data['userId']);

        Modular.to.pushReplacementNamed('/home');
      }
    } else {
      Modular.to.showDialog(
          child: CustomAlert(
              titulo: "Ocorreu um erro", msg: "Usuário ou senha inválidos"));
    }
  }

  criarConta(String nome, String cpf, String email, String senha) async {
    Map loginData = {'nome': nome, 'cpf': cpf, 'email': email, 'senha': senha};

    var response = await apiService.post('/criarConta', loginData);

    if (response != null && response.statusCode == 200)
      Modular.to.showDialog(
          child: CustomAlert(
        titulo: "Obrigado!",
        msg: "Conta criada com sucesso.",
      ));
  }

  deslogar() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

    Modular.to.pushReplacementNamed('/login');
  }
}
