import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/domain/usuario.dart';
import 'package:payandbuyapp/servicos/usuario/usuario-service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:via_cep/via_cep.dart';
part 'usuario-controller.g.dart';

class UsuarioController = _UsuarioControllerBase with _$UsuarioController;

abstract class _UsuarioControllerBase with Store {
  var usuarioService = UsuarioService();
  // StorageUploadTask uploadTask;

  @computed
  bool get isValid {
    return validarUsuario() == null &&
        validarCelular() == null &&
        validarCpf() == null &&
        validarDataNascimento() == null &&
        validarDdd() == null;
  }

  @observable
  Usuario usuario = Usuario();

  @observable
  bool carregando = false;

  String validarUsuario() {
    if (this.usuario.nome == null)
      return "Digite um nome.";
    else
      return null;
  }

  String validarCpf() {
    if (usuario.cpf == null || usuario.cpf.length < 11)
      return "Digite o seu CPF.";

    return null;
  }

  String validarDataNascimento() {
    if (usuario.dataNascimento == null) return "Digite sua data de nascimento.";

    return null;
  }

  String validarDdd() {
    if (this.usuario.ddd == null) return "Digite o seu código de área.";

    return null;
  }

  String validarCelular() {
    if (usuario.ddd == null) return "Digite o seu celular.";

    return null;
  }

  String validarCep() {
    if (usuario.cep != null && usuario.cep.length < 8)
      return "Seu CEP deve conter 8 caracteres.";

    return null;
  }

  // @action
  // Future<dynamic> uploadFoto(File image) async {
  //   if (image == null) return;

  //   final FirebaseStorage _storage =
  //       FirebaseStorage(storageBucket: 'gs://payandbuy-968ba.appspot.com');
  //   String filePath = 'images/${DateTime.now()}.png';
  //   uploadTask = _storage.ref().child(filePath).putFile(image);
  //   return await (await uploadTask.onComplete).ref.getDownloadURL();
  // }

  @action
  obterCep(context) async {
    if (usuario.cep.length == 8) {
      var cep = new via_cep();

      await cep.searchCEP(usuario.cep, 'json', '');

      if (cep.getResponse() == 200) {
        usuario.logradouro = cep.getLogradouro();
        usuario.complemento = cep.getComplemento();
        usuario.bairro = cep.getBairro();
        usuario.cidade = cep.getLocalidade();
        usuario.uf = cep.getUF();
      }
    }
  }

  @action
  obterUsuario() async {
    var sharedPref = await SharedPreferences.getInstance();
    const key = 'userId';
    var userId = sharedPref.get(key);

    if (userId.isNotEmpty)
      usuario = await usuarioService.get('/usuario/obter/', userId);
  }

  @action
  salvarUsuario() async {
    await usuarioService.edit('/usuario/editar/', usuario.toJson(), usuario.id);

    Modular.to.popAndPushNamed('/home');
  }
}
