// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_coleta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TipoColetaController on _TipoColetaControllerBase, Store {
  final _$tipoColetaListAtom =
      Atom(name: '_TipoColetaControllerBase.tipoColetaList');

  @override
  ObservableStream<List<TipoColeta>> get tipoColetaList {
    _$tipoColetaListAtom.reportRead();
    return super.tipoColetaList;
  }

  @override
  set tipoColetaList(ObservableStream<List<TipoColeta>> value) {
    _$tipoColetaListAtom.reportWrite(value, super.tipoColetaList, () {
      super.tipoColetaList = value;
    });
  }

  final _$_TipoColetaControllerBaseActionController =
      ActionController(name: '_TipoColetaControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_TipoColetaControllerBaseActionController
        .startAction(name: '_TipoColetaControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_TipoColetaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(BuildContext context, [TipoColeta model]) {
    final _$actionInfo = _$_TipoColetaControllerBaseActionController
        .startAction(name: '_TipoColetaControllerBase.addItem');
    try {
      return super.addItem(context, model);
    } finally {
      _$_TipoColetaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoColetaList: ${tipoColetaList}
    ''';
  }
}
