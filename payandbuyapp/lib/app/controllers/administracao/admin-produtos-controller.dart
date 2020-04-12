import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/domain/produto.dart';
import 'package:payandbuyapp/servicos/produto/produto-service.dart';
part 'admin-produtos-controller.g.dart';

class AdminProdutosController = _AdminProdutosControllerBase
    with _$AdminProdutosController;

abstract class _AdminProdutosControllerBase with Store {
  var produtoService = ProdutoService();

  @observable
  ObservableFuture<List<Produto>> produtos;

  @observable
  Produto produto = Produto()
    ..disponivel = false
    ..promocao = false
    ..fotos = [];

  @computed
  bool get isValid {
    return validarDescricao() == null;
  }

  @action
  validarDescricao() {
    if (produto.nome == null)
      return "Preencha a descrição";
    else
      return null;
  }

  @action
  listarProdutos() {
    produtos = produtoService.listar({}).asObservable();
  }

  @action
  obterProduto(String produtoId) async {
    produto = await produtoService.obter(produtoId);

    return produto;
  }

  @action
  inserirProduto() async {
    await produtoService.inserir(produto.toJson());
  }

  @action
  editarProduto() async {
    return await produtoService.editar(produto.toJson(), produto.id);
  }

  @action
  excluirProduto(produtoId) async {
    await produtoService.excluir(produtoId);
    await listarProdutos();
  }
}
