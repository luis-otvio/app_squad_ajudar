// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapaController on _MapaControllerBase, Store {
  final _$_mapToggleAtom = Atom(name: '_MapaControllerBase._mapToggle');

  @override
  bool get _mapToggle {
    _$_mapToggleAtom.reportRead();
    return super._mapToggle;
  }

  @override
  set _mapToggle(bool value) {
    _$_mapToggleAtom.reportWrite(value, super._mapToggle, () {
      super._mapToggle = value;
    });
  }

  final _$_cardDetalhadoAtom = Atom(name: '_MapaControllerBase._cardDetalhado');

  @override
  bool get _cardDetalhado {
    _$_cardDetalhadoAtom.reportRead();
    return super._cardDetalhado;
  }

  @override
  set _cardDetalhado(bool value) {
    _$_cardDetalhadoAtom.reportWrite(value, super._cardDetalhado, () {
      super._cardDetalhado = value;
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

  final _$cardIconAtom = Atom(name: '_MapaControllerBase.cardIcon');

  @override
  Icon get cardIcon {
    _$cardIconAtom.reportRead();
    return super.cardIcon;
  }

  @override
  set cardIcon(Icon value) {
    _$cardIconAtom.reportWrite(value, super.cardIcon, () {
      super.cardIcon = value;
    });
  }

  final _$cardTitleAtom = Atom(name: '_MapaControllerBase.cardTitle');

  @override
  String get cardTitle {
    _$cardTitleAtom.reportRead();
    return super.cardTitle;
  }

  @override
  set cardTitle(String value) {
    _$cardTitleAtom.reportWrite(value, super.cardTitle, () {
      super.cardTitle = value;
    });
  }

  final _$cardContentAtom = Atom(name: '_MapaControllerBase.cardContent');

  @override
  String get cardContent {
    _$cardContentAtom.reportRead();
    return super.cardContent;
  }

  @override
  set cardContent(String value) {
    _$cardContentAtom.reportWrite(value, super.cardContent, () {
      super.cardContent = value;
    });
  }

  final _$cardDiaSemanaAtom = Atom(name: '_MapaControllerBase.cardDiaSemana');

  @override
  String get cardDiaSemana {
    _$cardDiaSemanaAtom.reportRead();
    return super.cardDiaSemana;
  }

  @override
  set cardDiaSemana(String value) {
    _$cardDiaSemanaAtom.reportWrite(value, super.cardDiaSemana, () {
      super.cardDiaSemana = value;
    });
  }

  final _$cardHoraSemanaAtom = Atom(name: '_MapaControllerBase.cardHoraSemana');

  @override
  String get cardHoraSemana {
    _$cardHoraSemanaAtom.reportRead();
    return super.cardHoraSemana;
  }

  @override
  set cardHoraSemana(String value) {
    _$cardHoraSemanaAtom.reportWrite(value, super.cardHoraSemana, () {
      super.cardHoraSemana = value;
    });
  }

  final _$_MapaControllerBaseActionController =
      ActionController(name: '_MapaControllerBase');

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
  String toString() {
    return '''
mapController: ${mapController},
position: ${position},
markers: ${markers},
cardIcon: ${cardIcon},
cardTitle: ${cardTitle},
cardContent: ${cardContent},
cardDiaSemana: ${cardDiaSemana},
cardHoraSemana: ${cardHoraSemana}
    ''';
  }
}
