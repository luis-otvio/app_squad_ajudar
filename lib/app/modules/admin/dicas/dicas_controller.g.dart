// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DicasController on _DicasControllerBase, Store {
  final _$dicasListAtom = Atom(name: '_DicasControllerBase.dicasList');

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

  final _$_DicasControllerBaseActionController =
      ActionController(name: '_DicasControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_DicasControllerBaseActionController.startAction(
        name: '_DicasControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_DicasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(BuildContext context, [Dicas model]) {
    final _$actionInfo = _$_DicasControllerBaseActionController.startAction(
        name: '_DicasControllerBase.addItem');
    try {
      return super.addItem(context, model);
    } finally {
      _$_DicasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dicasList: ${dicasList}
    ''';
  }
}
