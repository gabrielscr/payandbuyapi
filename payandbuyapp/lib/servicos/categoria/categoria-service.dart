import 'package:payandbuyapp/domain/categoria.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class CategoriaService {
  final apiService = Api();

  inserir(Map body) async {
    var response = await apiService.post('/categoria/inserir', body);

    return response;
  }

  editar(Map body, String id) async {
    return await apiService.put('/categoria/editar/', body, id);
  }

  obter(String id) async {
    var response = await apiService.get('/categorias/', id);

    Categoria categoria = Categoria.fromJson(response);

    return categoria;
  }

  Future<List<Categoria>> listar(Map query) async {
    var response = await apiService.list('/categorias', query);
    List<Categoria> lista = [];

    if (response != null)
      for (var json in (response) as List) {
        Categoria categoria = Categoria.fromJson(json);

        lista.add(categoria);
      }

    return lista;
  }

  excluir(String id) async {
    return await apiService.delete('/categoria/excluir/', id);
  }
}
