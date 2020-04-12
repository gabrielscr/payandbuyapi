// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin-produtos-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminProdutosController on _AdminProdutosControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$produtosAtom = Atom(name: '_AdminProdutosControllerBase.produtos');

  @override
  ObservableFuture<List<Produto>> get produtos {
    _$produtosAtom.context.enforceReadPolicy(_$produtosAtom);
    _$produtosAtom.reportObserved();
    return super.produtos;
  }

  @override
  set produtos(ObservableFuture<List<Produto>> value) {
    _$produtosAtom.context.conditionallyRunInAction(() {
      super.produtos = value;
      _$produtosAtom.reportChanged();
    }, _$produtosAtom, name: '${_$produtosAtom.name}_set');
  }

  final _$produtoAtom = Atom(name: '_AdminProdutosControllerBase.produto');

  @override
  Produto get produto {
    _$produtoAtom.context.enforceReadPolicy(_$produtoAtom);
    _$produtoAtom.reportObserved();
    return super.produto;
  }

  @override
  set produto(Produto value) {
    _$produtoAtom.context.conditionallyRunInAction(() {
      super.produto = value;
      _$produtoAtom.reportChanged();
    }, _$produtoAtom, name: '${_$produtoAtom.name}_set');
  }

  final _$obterProdutoAsyncAction = AsyncAction('obterProduto');

  @override
  Future obterProduto(String produtoId) {
    return _$obterProdutoAsyncAction.run(() => super.obterProduto(produtoId));
  }

  final _$inserirProdutoAsyncAction = AsyncAction('inserirProduto');

  @override
  Future inserirProduto() {
    return _$inserirProdutoAsyncAction.run(() => super.inserirProduto());
  }

  final _$editarProdutoAsyncAction = AsyncAction('editarProduto');

  @override
  Future editarProduto() {
    return _$editarProdutoAsyncAction.run(() => super.editarProduto());
  }

  final _$excluirProdutoAsyncAction = AsyncAction('excluirProduto');

  @override
  Future excluirProduto(dynamic produtoId) {
    return _$excluirProdutoAsyncAction
        .run(() => super.excluirProduto(produtoId));
  }

  final _$_AdminProdutosControllerBaseActionController =
      ActionController(name: '_AdminProdutosControllerBase');

  @override
  dynamic validarDescricao() {
    final _$actionInfo =
        _$_AdminProdutosControllerBaseActionController.startAction();
    try {
      return super.validarDescricao();
    } finally {
      _$_AdminProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listarProdutos() {
    final _$actionInfo =
        _$_AdminProdutosControllerBaseActionController.startAction();
    try {
      return super.listarProdutos();
    } finally {
      _$_AdminProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'produtos: ${produtos.toString()},produto: ${produto.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
