import 'package:payandbuyapp/domain/produto.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class ProdutoService {
  final apiService = Api();

  inserir(Map body) async {
    var response = await apiService.post('/produtos/inserir', body);

    return response;
  }

  editar(Map body, String id) async {
    return await apiService.put('/produtos/editar/', body, id);
  }

  obter(String id) async {
    var response = await apiService.get('/produtos/', id);

    Produto produto = Produto.fromJson(response);

    return produto;
  }

  Future<List<Produto>> listar(Map query) async {
    var response = await apiService.list('/produtos', query);
    List<Produto> lista = [];

    if (response != null)
      for (var json in (response) as List) {
        Produto produto = Produto.fromJson(json);

        lista.add(produto);
      }

    return lista;
  }

  excluir(String id) async {
    return await apiService.delete('/produtos/excluir/', id);
  }
}
