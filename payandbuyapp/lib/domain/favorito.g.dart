// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorito.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Favorito on _FavoritoBase, Store {
  final _$idAtom = Atom(name: '_FavoritoBase.id');

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

  final _$nomeAtom = Atom(name: '_FavoritoBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$valorAtom = Atom(name: '_FavoritoBase.valor');

  @override
  String get valor {
    _$valorAtom.context.enforceReadPolicy(_$valorAtom);
    _$valorAtom.reportObserved();
    return super.valor;
  }

  @override
  set valor(String value) {
    _$valorAtom.context.conditionallyRunInAction(() {
      super.valor = value;
      _$valorAtom.reportChanged();
    }, _$valorAtom, name: '${_$valorAtom.name}_set');
  }

  final _$bannerAtom = Atom(name: '_FavoritoBase.banner');

  @override
  String get banner {
    _$bannerAtom.context.enforceReadPolicy(_$bannerAtom);
    _$bannerAtom.reportObserved();
    return super.banner;
  }

  @override
  set banner(String value) {
    _$bannerAtom.context.conditionallyRunInAction(() {
      super.banner = value;
      _$bannerAtom.reportChanged();
    }, _$bannerAtom, name: '${_$bannerAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'id: ${id.toString()},nome: ${nome.toString()},valor: ${valor.toString()},banner: ${banner.toString()}';
    return '{$string}';
  }
}
