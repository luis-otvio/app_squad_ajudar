import 'package:app_squad_ajudar/app/models/coleta.dart';
import 'package:app_squad_ajudar/app/modules/mapa/repositories/coleta_repository_interface.dart';
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
  ObservableStream<List<Coleta>> coletaList;
  @observable
  Set<Marker> markers = Set<Marker>();
  @observable
  Coleta coleta;

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

  void posicaoMarcacao() {
    coletaList.data.forEach((item) {
      Marker marker = Marker(
          markerId: MarkerId(item.reference.toString()),
          position:
              LatLng(item.pontoColeta.latitude, item.pontoColeta.longitude),
          onTap: () => _montaCardDetalhado(item));

      this.markers.add(marker);
    });
  }

  @action
  void _montaCardDetalhado(Coleta item) {
    cardDetalhado = true;
    this.coleta = item;
  }

  @action
  void hideCardDetalhado() {
    this.cardDetalhado = false;
  }
}
