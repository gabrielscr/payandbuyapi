// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoController on _CarrinhoControllerBase, Store {
  final _$cartIncludedAtom = Atom(name: '_CarrinhoControllerBase.cartIncluded');

  @override
  bool get cartIncluded {
    _$cartIncludedAtom.context.enforceReadPolicy(_$cartIncludedAtom);
    _$cartIncludedAtom.reportObserved();
    return super.cartIncluded;
  }

  @override
  set cartIncluded(bool value) {
    _$cartIncludedAtom.context.conditionallyRunInAction(() {
      super.cartIncluded = value;
      _$cartIncludedAtom.reportChanged();
    }, _$cartIncludedAtom, name: '${_$cartIncludedAtom.name}_set');
  }

  final _$subtotalAtom = Atom(name: '_CarrinhoControllerBase.subtotal');

  @override
  double get subtotal {
    _$subtotalAtom.context.enforceReadPolicy(_$subtotalAtom);
    _$subtotalAtom.reportObserved();
    return super.subtotal;
  }

  @override
  set subtotal(double value) {
    _$subtotalAtom.context.conditionallyRunInAction(() {
      super.subtotal = value;
      _$subtotalAtom.reportChanged();
    }, _$subtotalAtom, name: '${_$subtotalAtom.name}_set');
  }

  final _$isIncrementAtom = Atom(name: '_CarrinhoControllerBase.isIncrement');

  @override
  bool get isIncrement {
    _$isIncrementAtom.context.enforceReadPolicy(_$isIncrementAtom);
    _$isIncrementAtom.reportObserved();
    return super.isIncrement;
  }

  @override
  set isIncrement(bool value) {
    _$isIncrementAtom.context.conditionallyRunInAction(() {
      super.isIncrement = value;
      _$isIncrementAtom.reportChanged();
    }, _$isIncrementAtom, name: '${_$isIncrementAtom.name}_set');
  }

  final _$itensAtom = Atom(name: '_CarrinhoControllerBase.itens');

  @override
  ObservableList<Itens> get itens {
    _$itensAtom.context.enforceReadPolicy(_$itensAtom);
    _$itensAtom.reportObserved();
    return super.itens;
  }

  @override
  set itens(ObservableList<Itens> value) {
    _$itensAtom.context.conditionallyRunInAction(() {
      super.itens = value;
      _$itensAtom.reportChanged();
    }, _$itensAtom, name: '${_$itensAtom.name}_set');
  }

  final _$_CarrinhoControllerBaseActionController =
      ActionController(name: '_CarrinhoControllerBase');

  @override
  dynamic addItemCarrinho(Favorito produto) {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.addItemCarrinho(produto);
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removerItemCarrinho(Itens item) {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.removerItemCarrinho(item);
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic aumentarQuantidade(Itens item) {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.aumentarQuantidade(item);
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic diminuirQuantidade(Itens item) {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.diminuirQuantidade(item);
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calcularItem(Itens item) {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.calcularItem(item);
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calcularTotal() {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.calcularTotal();
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removerItensCarrinho() {
    final _$actionInfo =
        _$_CarrinhoControllerBaseActionController.startAction();
    try {
      return super.removerItensCarrinho();
    } finally {
      _$_CarrinhoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cartIncluded: ${cartIncluded.toString()},subtotal: ${subtotal.toString()},isIncrement: ${isIncrement.toString()},itens: ${itens.toString()}';
    return '{$string}';
  }
}
