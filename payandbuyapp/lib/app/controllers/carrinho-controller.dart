import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/app/utils/utils.dart';
import 'package:payandbuyapp/app/widgets/custom-alert.dart';
import 'package:payandbuyapp/domain/carrinho.dart';
import 'package:payandbuyapp/domain/favorito.dart';
import 'package:payandbuyapp/domain/produto.dart';
part 'carrinho-controller.g.dart';

class CarrinhoController = _CarrinhoControllerBase with _$CarrinhoController;

abstract class _CarrinhoControllerBase with Store {
  @observable
  bool cartIncluded = false;

  @observable
  double subtotal = 0;

  @observable
  bool isIncrement = false;

  @observable
  ObservableList<Itens> itens = ObservableList<Itens>().asObservable();

  @action
  addItemCarrinho(Favorito produto) {
    cartIncluded = false;

    var item = Itens(
      banner: produto.banner,
      id: produto.id,
      nome: produto.nome,
      quantidade: 1,
      valor: produto.valor,
    );

    if (itens.any((e) => e.id == item.id)) {
      Modular.to.showDialog(
          child: CustomAlert(
              msg: 'Produto já adicionado no seu carrinho, verifique.',
              titulo: 'Ops!'));
    } else {
      itens.add(item);
      cartIncluded = true;
      calcularTotal();
    }
  }

  @action
  removerItemCarrinho(Itens item) {
    itens.remove(item);
    itens = itens;
    calcularTotal();
  }

  @action
  aumentarQuantidade(Itens item) {
    isIncrement = true;
    item.quantidade++;
    calcularItem(item);
    itens = itens;
    calcularTotal();
  }

  @action
  diminuirQuantidade(Itens item) {
    isIncrement = false;
    item.quantidade--;
    calcularItem(item);
    itens = itens;
    calcularTotal();
  }

  @action
  calcularItem(Itens item) {
    item.valorBruto = item.valor * item.quantidade;
  }

  @action
  calcularTotal() {
    if (itens.length > 0)
      subtotal = itens
          .map((e) => double.parse(e.valorBruto) == null
              ? double.parse(e.valor)
              : double.parse(e.valorBruto))
          .reduce((sum));
  }

  @action
  removerItensCarrinho() {
    itens.clear();
  }
}
