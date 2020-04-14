import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/servicos/autenticacao/login-service.dart';
part 'login-controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var loginService = LoginService();

  @computed
  bool get isValid {
    return validateEmail() == null &&
        validatePassword() == null &&
        validateCpf() == null &&
        validateNome() == null;
  }

  @observable
  String email = "";

  @action
  changeEmail(String novoEmail) => email = novoEmail;

  @observable
  String senha = "";

  @action
  changeSenha(String novaSenha) => senha = novaSenha;

  @observable
  String nome = "";

  @action
  changeNome(String novoNome) => nome = novoNome;

  @observable
  String cpf = "";

  @action
  changeCpf(String novoCpf) => cpf = novoCpf;

  @observable
  bool loading = false;

  String validateEmail() {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = new RegExp(pattern);

    if (this.email.length > 1 && !regex.hasMatch(this.email))
      return 'Por favor, digite um e-mail válido.';
    else
      return null;
  }

  String validateNome() {
    if (this.nome.length > 3)
      return null;
    else
      return "Preencha com o seu nome";
  }

  String validateCpf() {
    if (this.cpf.length >= 11)
      return null;
    else
      return "Preencha com o seu CPF";
  }

  String validatePassword() {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = new RegExp(pattern);
    if (this.senha.length > 0 && !regex.hasMatch(this.senha))
      return 'Sua senha precisa ter 6 caracteres ou mais.';
    else
      return null;
  }

  @action
  Future logar() async {
    if (this.email.isEmpty || this.senha.isEmpty) return;

    await loginService.logar(this.email, this.senha);
  }

  @action
  Future criarConta() async {
    if (this.email.isEmpty || this.senha.isEmpty) return;

    await loginService.criarConta(this.nome, this.cpf, this.email, this.senha);
  }

  @action
  logoff() {
    loginService.deslogar();
  }
}
