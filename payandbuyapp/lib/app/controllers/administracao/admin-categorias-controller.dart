import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/domain/categoria.dart';
import 'package:payandbuyapp/servicos/categoria/categoria-service.dart';
part 'admin-categorias-controller.g.dart';

class AdminCategoriasController = _AdminCategoriasControllerBase
    with _$AdminCategoriasController;

abstract class _AdminCategoriasControllerBase with Store {
  var categoriaService = CategoriaService();

  @observable
  ObservableFuture<List<Categoria>> categorias;

  @observable
  Categoria categoria = Categoria();

  @computed
  bool get isValid {
    return validarDescricao() == null;
  }

  @action
  validarDescricao() {
    if (categoria.descricao == null)
      return "Preencha a descrição";
    else
      return null;
  }

  @action
  listarCategorias() {
    categorias = categoriaService.listar({}).asObservable();
  }

  @action
  obterCategoria(String categoriaId) async {
    categoria = await categoriaService.obter({'Id': categoriaId});

    return categoria;
  }

  @action
  inserirCategoria() async {
    await categoriaService.inserir(categoria.toJson());
  }

  @action
  editarCategoria() async {
    return await categoriaService.editar(categoria.toJson());
  }
}
