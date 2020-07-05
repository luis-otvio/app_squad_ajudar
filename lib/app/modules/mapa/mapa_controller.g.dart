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

  final _$mapZoomAtom = Atom(name: '_MapaControllerBase.mapZoom');

  @override
  double get mapZoom {
    _$mapZoomAtom.reportRead();
    return super.mapZoom;
  }

  @override
  set mapZoom(double value) {
    _$mapZoomAtom.reportWrite(value, super.mapZoom, () {
      super.mapZoom = value;
    });
  }

  final _$tipoColetaListAtom = Atom(name: '_MapaControllerBase.tipoColetaList');

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

  final _$pontoColetaListAtom =
      Atom(name: '_MapaControllerBase.pontoColetaList');

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

  final _$markersAtom = Atom(name: '_MapaControllerBase.markers');

  @override
  ObservableSet<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(ObservableSet<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$pontoColetaAtom = Atom(name: '_MapaControllerBase.pontoColeta');

  @override
  PontoColeta get pontoColeta {
    _$pontoColetaAtom.reportRead();
    return super.pontoColeta;
  }

  @override
  set pontoColeta(PontoColeta value) {
    _$pontoColetaAtom.reportWrite(value, super.pontoColeta, () {
      super.pontoColeta = value;
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
  void posicaoMarcacao() {
    final _$actionInfo = _$_MapaControllerBaseActionController.startAction(
        name: '_MapaControllerBase.posicaoMarcacao');
    try {
      return super.posicaoMarcacao();
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
mapZoom: ${mapZoom},
tipoColetaList: ${tipoColetaList},
pontoColetaList: ${pontoColetaList},
markers: ${markers},
pontoColeta: ${pontoColeta}
    ''';
  }
}
