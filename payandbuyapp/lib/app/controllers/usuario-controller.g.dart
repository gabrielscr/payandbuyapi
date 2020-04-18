// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuarioController on _UsuarioControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$usuarioAtom = Atom(name: '_UsuarioControllerBase.usuario');

  @override
  Usuario get usuario {
    _$usuarioAtom.context.enforceReadPolicy(_$usuarioAtom);
    _$usuarioAtom.reportObserved();
    return super.usuario;
  }

  @override
  set usuario(Usuario value) {
    _$usuarioAtom.context.conditionallyRunInAction(() {
      super.usuario = value;
      _$usuarioAtom.reportChanged();
    }, _$usuarioAtom, name: '${_$usuarioAtom.name}_set');
  }

  final _$carregandoAtom = Atom(name: '_UsuarioControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.context.enforceReadPolicy(_$carregandoAtom);
    _$carregandoAtom.reportObserved();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.context.conditionallyRunInAction(() {
      super.carregando = value;
      _$carregandoAtom.reportChanged();
    }, _$carregandoAtom, name: '${_$carregandoAtom.name}_set');
  }

  final _$obterCepAsyncAction = AsyncAction('obterCep');

  @override
  Future obterCep(dynamic context) {
    return _$obterCepAsyncAction.run(() => super.obterCep(context));
  }

  final _$obterUsuarioAsyncAction = AsyncAction('obterUsuario');

  @override
  Future obterUsuario() {
    return _$obterUsuarioAsyncAction.run(() => super.obterUsuario());
  }

  final _$salvarUsuarioAsyncAction = AsyncAction('salvarUsuario');

  @override
  Future salvarUsuario() {
    return _$salvarUsuarioAsyncAction.run(() => super.salvarUsuario());
  }

  @override
  String toString() {
    final string =
        'usuario: ${usuario.toString()},carregando: ${carregando.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
