// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void navigateToScreens(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.navigateToScreens(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'currentIndex: ${currentIndex.toString()}';
    return '{$string}';
  }
}
