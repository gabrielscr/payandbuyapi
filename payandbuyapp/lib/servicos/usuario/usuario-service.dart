import 'package:payandbuyapp/domain/usuario.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class UsuarioService {
  final apiService = Api();

  Future<Usuario> get(String url, String id) async {
    var response = await apiService.get(url, id);
    Usuario usuario = Usuario.fromJson(response);

    return usuario;
  }

  insert(String url, Map body) async {
    return await apiService.post(url, body);
  }

  edit(String url, Map body, String id) async {
    return await apiService.put(url, body, id);
  }
}
