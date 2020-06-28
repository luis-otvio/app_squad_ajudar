// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ponto_coleta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PontoColetaController on _PontoColetaControllerBase, Store {
  final _$pontoColetaListAtom =
      Atom(name: '_PontoColetaControllerBase.pontoColetaList');

  @override
  ObservableStream<List<PontoColeta>> get pontoColetaList {
    _$pontoColetaListAtom.reportRead();
    return super.pontoColetaList;
  }

  @override
  set pontoColetaList(ObservableStream<List<PontoColeta>> value) {
    _$pontoColetaListAtom.reportWrite(value, super.pontoColetaList, () {
      super.pontoColetaList = value;
    });
  }

  final _$_PontoColetaControllerBaseActionController =
      ActionController(name: '_PontoColetaControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_PontoColetaControllerBaseActionController
        .startAction(name: '_PontoColetaControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_PontoColetaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pontoColetaList: ${pontoColetaList}
    ''';
  }
}
