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
  final Geolocator geolocator = Geolocator();

  @observable
  bool exibeMapa = false;
  @observable
  bool cardDetalhado = false;

  @observable
  GoogleMapController mapController;
  @observable
  Position position;
  @observable
  ObservableStream<List<ColetaModel>> coletaList;
  @observable
  Set<Marker> markers = Set<Marker>();

  @computed
  _MapaControllerBase(this.repository) {
    this.getList();

    this.getPosition().then((value) {
      if (value) {
        exibeMapa = true;
      }
    });
  }

  @action
  void getList() {
    coletaList = repository.getColetas().asObservable();
  }

  void onMapCreated(GoogleMapController controller) {
    this.mapController = controller;
  }

  void posicaoAtual() {
    LatLng position = LatLng(this.position.latitude, this.position.longitude);
    mapController.moveCamera(CameraUpdate.newLatLng(position));
  }

  @action
  Future getPosition() async {
    position = await geolocator.getLastKnownPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (position == null) {
      position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }

    return true;
  }

  @action
  void posicaoMarcacao() {
    List<ColetaModel> listMarkers = coletaList.data;

    listMarkers.forEach((item) {
      Marker marker = Marker(
          markerId: MarkerId(item.reference.toString()),
          position:
              LatLng(item.pontoColeta.latitude, item.pontoColeta.longitude),
          onTap: () => _montaCard(item));

      this.markers.add(marker);
    });
  }

  @action
  void hideCardDetalhado() {
    this.cardDetalhado = false;
  }

  // separar
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

  void _montaCard(ColetaModel item) {
    cardDetalhado = true;
    cardIcon = Icon(Icons.close);
    cardTitle = item.tipoColeta.toString();
    cardContent = "item.tipoColeta";
    cardDiaSemana = item.dia.keys.toString();
  }
}
