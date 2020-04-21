// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_trans_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListTransitionStore on ListTransitionBase, Store {
  final _$transAtom = Atom(name: 'ListTransitionBase.trans');

  @override
  List<Transaction> get trans {
    _$transAtom.context.enforceReadPolicy(_$transAtom);
    _$transAtom.reportObserved();
    return super.trans;
  }

  @override
  set trans(List<Transaction> value) {
    _$transAtom.context.conditionallyRunInAction(() {
      super.trans = value;
      _$transAtom.reportChanged();
    }, _$transAtom, name: '${_$transAtom.name}_set');
  }

  final _$ListTransitionBaseActionController =
      ActionController(name: 'ListTransitionBase');

  @override
  void loadTransaction() {
    final _$actionInfo = _$ListTransitionBaseActionController.startAction();
    try {
      return super.loadTransaction();
    } finally {
      _$ListTransitionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'trans: ${trans.toString()}';
    return '{$string}';
  }
}
