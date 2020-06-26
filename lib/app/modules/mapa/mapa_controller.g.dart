// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapaController on _MapaControllerBase, Store {
  final _$exibeMapaAtom = Atom(name: '_MapaControllerBase.exibeMapa');

  @override
  bool get exibeMapa {
    _$exibeMapaAtom.reportRead();
    return super.exibeMapa;
  }

  @override
  set exibeMapa(bool value) {
    _$exibeMapaAtom.reportWrite(value, super.exibeMapa, () {
      super.exibeMapa = value;
    });
  }

  final _$cardDetalhadoAtom = Atom(name: '_MapaControllerBase.cardDetalhado');

  @override
  bool get cardDetalhado {
    _$cardDetalhadoAtom.reportRead();
    return super.cardDetalhado;
  }

  @override
  set cardDetalhado(bool value) {
    _$cardDetalhadoAtom.reportWrite(value, super.cardDetalhado, () {
      super.cardDetalhado = value;
    });
  }

  final _$mapControllerAtom = Atom(name: '_MapaControllerBase.mapController');

  @override
  GoogleMapController get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
    });
  }

  final _$positionAtom = Atom(name: '_MapaControllerBase.position');

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$coletaListAtom = Atom(name: '_MapaControllerBase.coletaList');

  @override
  ObservableStream<List<Coleta>> get coletaList {
    _$coletaListAtom.reportRead();
    return super.coletaList;
  }

  @override
  set coletaList(ObservableStream<List<Coleta>> value) {
    _$coletaListAtom.reportWrite(value, super.coletaList, () {
      super.coletaList = value;
    });
  }

  final _$markersAtom = Atom(name: '_MapaControllerBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$coletaAtom = Atom(name: '_MapaControllerBase.coleta');

  @override
  Coleta get coleta {
    _$coletaAtom.reportRead();
    return super.coleta;
  }

  @override
  set coleta(Coleta value) {
    _$coletaAtom.reportWrite(value, super.coleta, () {
      super.coleta = value;
    });
  }

  final _$getPositionAsyncAction =
      AsyncAction('_MapaControllerBase.getPosition');

  @override
  Future<dynamic> getPosition() {
    return _$getPositionAsyncAction.run(() => super.getPosition());
  }

  final _$_MapaControllerBaseActionController =
      ActionController(name: '_MapaControllerBase');

  @override
  void getList() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _montaCardDetalhado(Coleta item) {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase._montaCardDetalhado');
    try {
      return super._montaCardDetalhado(item);
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideCardDetalhado() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.hideCardDetalhado');
    try {
      return super.hideCardDetalhado();
    } finally {
      _$_MapaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exibeMapa: ${exibeMapa},
cardDetalhado: ${cardDetalhado},
mapController: ${mapController},
position: ${position},
coletaList: ${coletaList},
markers: ${markers},
coleta: ${coleta}
    ''';
  }
}
