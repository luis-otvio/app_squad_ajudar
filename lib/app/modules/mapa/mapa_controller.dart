import 'package:app_squad_ajudar/app/models/ponto_coleta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  final Firestore firestore;
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
  ObservableStream<List<PontoColeta>> pontoColetaList;
  @observable
  ObservableSet<Marker> markers = Set<Marker>().asObservable();
  @observable
  PontoColeta pontoColeta;

  @computed
  _MapaControllerBase(this.firestore) {
    this.getList();

    this.getPosition().then((value) {
      if (value) {
        exibeMapa = true;
      }
    });
  }

  @action
  void getList() {
    pontoColetaList =
        firestore.collection(PontoColeta().toString()).snapshots().map((query) {
      return query.documents.map((doc) {
        return PontoColeta.fromDocument(doc);
      }).toList();
    }).asObservable();
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
    pontoColetaList.data.forEach((item) {
      Marker marker = Marker(
          markerId: MarkerId(item.reference.toString()),
          position: LatLng(item.geoPoint.latitude, item.geoPoint.longitude),
          onTap: () => _montaCardDetalhado(item));

      this.markers.add(marker);
    });
  }

  @action
  void _montaCardDetalhado(PontoColeta item) {
    cardDetalhado = true;
    this.pontoColeta = item;
  }

  @action
  void hideCardDetalhado() {
    this.cardDetalhado = false;
    this.pontoColeta = null;
  }
}
