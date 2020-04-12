import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:payandbuyapp/domain/categoria.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class CategoriaService {
  final apiService = Api();

  inserir(Map body) async {
    Response response = await apiService.post('/categoria/inserir', body);
  }

  editar(Map body) async {
    return await apiService.put('Categoria/EditarCategoria', body);
  }

  obter(Map query) async {
    var response = await apiService.get('/categoria/', query);

    Categoria categoria = Categoria.fromJson(response);

    return categoria;
  }

  Future<List<Categoria>> listar(Map query) async {
    var response = await apiService.get('/categorias', query);
    List<Categoria> lista = [];

    for (var json in (response) as List) {
      Categoria categoria = Categoria.fromJson(json);

      lista.add(categoria);
    }

    return lista;
  }

  excluir(Map body) async {
    return await apiService.delete('Categoria/ExcluirCategoria', body);
  }
}
