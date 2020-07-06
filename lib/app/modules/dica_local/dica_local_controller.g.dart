// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dica_local_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DicaLocalController on _DicaLocalControllerBase, Store {
  final _$dicasListAtom = Atom(name: '_DicaLocalControllerBase.dicasList');

  @override
  ObservableStream<List<Dicas>> get dicasList {
    _$dicasListAtom.reportRead();
    return super.dicasList;
  }

  @override
  set dicasList(ObservableStream<List<Dicas>> value) {
    _$dicasListAtom.reportWrite(value, super.dicasList, () {
      super.dicasList = value;
    });
  }

  final _$_DicaLocalControllerBaseActionController =
      ActionController(name: '_DicaLocalControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_DicaLocalControllerBaseActionController.startAction(
        name: '_DicaLocalControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_DicaLocalControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dicasList: ${dicasList}
    ''';
  }
}
