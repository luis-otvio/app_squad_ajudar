// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdminController on _AdminControllerBase, Store {
  final _$userAtom = Atom(name: '_AdminControllerBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$logadoAtom = Atom(name: '_AdminControllerBase.logado');

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  final _$singInAsyncAction = AsyncAction('_AdminControllerBase.singIn');

  @override
  Future<dynamic> singIn() {
    return _$singInAsyncAction.run(() => super.singIn());
  }

  @override
  String toString() {
    return '''
user: ${user},
logado: ${logado}
    ''';
  }
}
