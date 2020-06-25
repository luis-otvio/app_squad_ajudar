import 'dart:math';

import 'package:app_squad_ajudar/app/modules/mapa/models/coleta_model.dart';
import 'package:app_squad_ajudar/app/modules/mapa/repositories/coleta_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  final IColetaRepository repository;

  @observable
  ObservableStream<List<ColetaModel>> coletaList;

  _MapaControllerBase(this.repository) {
    getList();
  }

  @action
  getList() {
    coletaList = repository.getColetas().asObservable();
  }

  @observable
  bool _mapToggle = false;
  bool get mapToggle => _mapToggle;
  final Geolocator _geolocator = Geolocator();

  @observable
  bool _cardDetalhado = false;
  bool get cardDetalhado => _cardDetalhado;

  @action
  void hideCardDetalhado() {
    this._cardDetalhado = false;
  }

  @observable
  GoogleMapController mapController;
  @observable
  Position position;

  @observable
  Set<Marker> markers = Set<Marker>();

  void getPosition() async {
    position = await _geolocator.getLastKnownPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (position == null) {
      position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
    _mapToggle = true;
    posicaoMarcacao();
  }

  void onMapCreated(GoogleMapController controller) {
    this.mapController = controller;
  }

  void posicaoAtual() {
    LatLng position = LatLng(this.position.latitude, this.position.longitude);
    mapController.moveCamera(CameraUpdate.newLatLng(position));
  }

  @action
  void posicaoMarcacao() {
    final List<Map<String, dynamic>> listMarkers = [
      {
        'id': Random().nextInt(1000).toString(),
        'pontoColeta': [-20.09886050067417, -45.28216905891895],
        'dia': {
          'seg': [
            {'horaInicio': '12:00', 'horaFim': '12:30'}
          ],
          'qua': [
            {'horaInicio': '12:30', 'horaFim': '13:00'}
          ],
          'sex': [
            {'horaInicio': '16:30', 'horaFim': '17:00'}
          ],
        },
        'tipoColeta': [
          {'organico': 'Orgânico'},
          {'inorganico': 'Inorgânico'},
          {'eletronico': 'Eletrônico'},
        ],
        'descricao':
            'A expressão Lorem ipsum em design gráfico e editoração é um texto padrão em latim utilizado na produção gráfica para preencher os espaços de texto em publicações para testar e ajustar aspectos visuais antes de utilizar conteúdo real.',
      }
    ];

    listMarkers.forEach((item) {
      Marker marker = Marker(
          markerId: MarkerId(item['id']),
          position: LatLng(item['pontoColeta'][0], item['pontoColeta'][1]),
          onTap: () => _montaCard(item));

      this.markers.add(marker);
    });
  }

  //
  @observable
  Icon cardIcon;
  @observable
  String cardTitle;
  @observable
  String cardContent;
  @observable
  String cardDiaSemana;
  @observable
  String cardHoraSemana;

  void _montaCard(Map<String, dynamic> item) {
    _cardDetalhado = true;
    cardIcon = Icon(Icons.close);
    cardTitle = item['tipoColeta'][0]['organico'];
    cardContent = item['descricao'];
    cardDiaSemana = item['dia'].keys.toString();
  }
}
