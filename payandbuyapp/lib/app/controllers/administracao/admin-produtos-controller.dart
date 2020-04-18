import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/domain/favorito.dart';
import 'package:payandbuyapp/domain/produto.dart';
import 'package:payandbuyapp/servicos/produto/produto-service.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'admin-produtos-controller.g.dart';

class AdminProdutosController = _AdminProdutosControllerBase
    with _$AdminProdutosController;

abstract class _AdminProdutosControllerBase with Store {
  var produtoService = ProdutoService();

  @observable
  ObservableFuture<List<Produto>> produtos;

  @observable
  List<Favorito> favoritos;

  @observable
  bool loading = false;

  @observable
  bool favorito = false;

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

  @action
  checarSeFavorito(int produtoId) async {
    var sharedPref = await SharedPreferences.getInstance();
    const key = 'userId';
    var userId = sharedPref.get(key);

    var result =
        await produtoService.obterFavorito({'Id': produtoId, 'UserId': userId});

    if (result == null)
      favorito = false;
    else
      favorito = true;
  }

  @action
  adicionarFavorito(String productId) async {
    var sharedPref = await SharedPreferences.getInstance();
    const key = 'userId';
    var userId = sharedPref.get(key);

    await produtoService
        .adicionarFavorito({'produtoId': productId, 'userId': userId});

    await listarFavoritos();
  }

  @action
  removerFavorito(String produtoId) async {
    await produtoService.excluirFavorito(produtoId);

    await listarFavoritos();
  }

  @action
  listarFavoritos() async {
    loading = true;
    favoritos = await produtoService.listarFavoritos({});
    loading = false;
  }

  @action
  handleFavoritoChange(String productId) async {
    favorito = !favorito;

    if (favorito)
      await adicionarFavorito(productId);
    else
      await removerFavorito(productId);

    await listarFavoritos();
  }
}
