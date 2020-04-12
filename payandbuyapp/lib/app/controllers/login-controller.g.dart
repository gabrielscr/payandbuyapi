// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$logarAsyncAction = AsyncAction('logar');

  @override
  Future<dynamic> logar() {
    return _$logarAsyncAction.run(() => super.logar());
  }

  final _$criarContaAsyncAction = AsyncAction('criarConta');

  @override
  Future<dynamic> criarConta() {
    return _$criarContaAsyncAction.run(() => super.criarConta());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeEmail(String novoEmail) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changeEmail(novoEmail);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String novaSenha) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changeSenha(novaSenha);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logoff() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.logoff();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},loading: ${loading.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
