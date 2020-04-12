// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Categoria on _CategoriaBase, Store {
  final _$idAtom = Atom(name: '_CategoriaBase.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$descricaoAtom = Atom(name: '_CategoriaBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.context.enforceReadPolicy(_$descricaoAtom);
    _$descricaoAtom.reportObserved();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.context.conditionallyRunInAction(() {
      super.descricao = value;
      _$descricaoAtom.reportChanged();
    }, _$descricaoAtom, name: '${_$descricaoAtom.name}_set');
  }

  final _$fotoAtom = Atom(name: '_CategoriaBase.foto');

  @override
  String get foto {
    _$fotoAtom.context.enforceReadPolicy(_$fotoAtom);
    _$fotoAtom.reportObserved();
    return super.foto;
  }

  @override
  set foto(String value) {
    _$fotoAtom.context.conditionallyRunInAction(() {
      super.foto = value;
      _$fotoAtom.reportChanged();
    }, _$fotoAtom, name: '${_$fotoAtom.name}_set');
  }

  final _$criadoEmAtom = Atom(name: '_CategoriaBase.criadoEm');

  @override
  String get criadoEm {
    _$criadoEmAtom.context.enforceReadPolicy(_$criadoEmAtom);
    _$criadoEmAtom.reportObserved();
    return super.criadoEm;
  }

  @override
  set criadoEm(String value) {
    _$criadoEmAtom.context.conditionallyRunInAction(() {
      super.criadoEm = value;
      _$criadoEmAtom.reportChanged();
    }, _$criadoEmAtom, name: '${_$criadoEmAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},descricao: ${descricao.toString()},foto: ${foto.toString()},criadoEm: ${criadoEm.toString()}';
    return '{$string}';
  }
}
