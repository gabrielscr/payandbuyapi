// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin-categorias-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminCategoriasController on _AdminCategoriasControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$categoriasAtom =
      Atom(name: '_AdminCategoriasControllerBase.categorias');

  @override
  ObservableFuture<List<Categoria>> get categorias {
    _$categoriasAtom.context.enforceReadPolicy(_$categoriasAtom);
    _$categoriasAtom.reportObserved();
    return super.categorias;
  }

  @override
  set categorias(ObservableFuture<List<Categoria>> value) {
    _$categoriasAtom.context.conditionallyRunInAction(() {
      super.categorias = value;
      _$categoriasAtom.reportChanged();
    }, _$categoriasAtom, name: '${_$categoriasAtom.name}_set');
  }

  final _$categoriaAtom =
      Atom(name: '_AdminCategoriasControllerBase.categoria');

  @override
  Categoria get categoria {
    _$categoriaAtom.context.enforceReadPolicy(_$categoriaAtom);
    _$categoriaAtom.reportObserved();
    return super.categoria;
  }

  @override
  set categoria(Categoria value) {
    _$categoriaAtom.context.conditionallyRunInAction(() {
      super.categoria = value;
      _$categoriaAtom.reportChanged();
    }, _$categoriaAtom, name: '${_$categoriaAtom.name}_set');
  }

  final _$obterCategoriaAsyncAction = AsyncAction('obterCategoria');

  @override
  Future obterCategoria(String categoriaId) {
    return _$obterCategoriaAsyncAction
        .run(() => super.obterCategoria(categoriaId));
  }

  final _$inserirCategoriaAsyncAction = AsyncAction('inserirCategoria');

  @override
  Future inserirCategoria() {
    return _$inserirCategoriaAsyncAction.run(() => super.inserirCategoria());
  }

  final _$editarCategoriaAsyncAction = AsyncAction('editarCategoria');

  @override
  Future editarCategoria() {
    return _$editarCategoriaAsyncAction.run(() => super.editarCategoria());
  }

  final _$_AdminCategoriasControllerBaseActionController =
      ActionController(name: '_AdminCategoriasControllerBase');

  @override
  dynamic validarDescricao() {
    final _$actionInfo =
        _$_AdminCategoriasControllerBaseActionController.startAction();
    try {
      return super.validarDescricao();
    } finally {
      _$_AdminCategoriasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listarCategorias() {
    final _$actionInfo =
        _$_AdminCategoriasControllerBaseActionController.startAction();
    try {
      return super.listarCategorias();
    } finally {
      _$_AdminCategoriasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'categorias: ${categorias.toString()},categoria: ${categoria.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
