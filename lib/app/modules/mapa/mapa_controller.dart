import 'dart:convert';

import 'package:app_squad_ajudar/app/models/ponto_coleta.dart';
import 'package:app_squad_ajudar/app/models/tipo_coleta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'mapa_controller.g.dart';

class MapaController = _MapaControllerBase with _$MapaController;

abstract class _MapaControllerBase with Store {
  BitmapDescriptor garbageIcon;
  BitmapDescriptor garbageTruck;
  final Firestore firestore = Firestore.instance;
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
  double mapZoom;
  @observable
  ObservableStream<List<TipoColeta>> tipoColetaList;
  @observable
  ObservableStream<List<PontoColeta>> pontoColetaList;
  @observable
  ObservableSet<Marker> markers = Set<Marker>().asObservable();
  @observable
  PontoColeta pontoColeta;

  @computed
  _MapaControllerBase() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(64, 64)),
      "assets/marker_icons/garbage.png",
    ).then((value) => this.garbageIcon = value);
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(64, 64)),
      "assets/marker_icons/garbageTruck.png",
    ).then((value) => this.garbageTruck = value);

    this.getList();

    this.getPosition().then((value) {
      if (value) {
        exibeMapa = true;
      }
    });
  }

  @action
  void getList() {
    pontoColetaList = firestore
        .collection(PontoColeta().toString())
        .where("ativo", isEqualTo: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return PontoColeta.fromDocument(doc);
      }).toList();
    }).asObservable();

    tipoColetaList =
        firestore.collection(TipoColeta().toString()).snapshots().map((query) {
      return query.documents.map((doc) {
        return TipoColeta.fromDocument(doc);
      }).toList();
    }).asObservable();
  }

  Future onMapCreated(GoogleMapController controller) async {
    this.mapController = controller;
    // https://mapstyle.withgoogle.com/
    await this.mapController.setMapStyle(
          [
            {
              "featureType": "administrative",
              "elementType": "geometry",
              "stylers": [
                {"visibility": "off"}
              ]
            },
            {
              "featureType": "poi",
              "stylers": [
                {"visibility": "off"}
              ]
            },
            {
              "featureType": "road",
              "elementType": "labels.icon",
              "stylers": [
                {"visibility": "off"}
              ]
            },
            {
              "featureType": "transit",
              "stylers": [
                {"visibility": "off"}
              ]
            }
          ].toString(),
        );
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
    pontoColetaList.data.forEach((PontoColeta item) {
      Marker marker = Marker(
        icon: this.garbageIcon,
        markerId: MarkerId(item.reference.documentID),
        position: LatLng(item.geoPoint.latitude, item.geoPoint.longitude),
        onTap: () {
          this.cardDetalhado = true;
          this.pontoColeta = item;
        },
      );

      this.markers.add(marker);
    });
    getCidadeLimpaBD();
  }

  @action
  void hideCardDetalhado() {
    this.cardDetalhado = false;
    this.pontoColeta = null;
  }

  void getCidadeLimpaBD() async {
    try {
      Response response = await Dio().get(
          "http://www.bomdespacho.mg.gov.br/cidadelimpa/?api&action=getPosition");
      var data = jsonDecode(response.data);

      if (data.isNotEmpty) {
        data.forEach((item) {
          print(item);
          Marker marker = Marker(
            icon: this.garbageTruck,
            markerId: MarkerId(item['Oid'].toString()),
            position: LatLng(
              double.parse(item['Lat']),
              double.parse(item['Lng']),
            ),
            infoWindow: InfoWindow(title: "Caminhão de Coleta"),
          );

          this.markers.add(marker);
        });
      } else {
        print("Sem dados da API da Prefeitura");
      }
      // print(response);
    } catch (e) {
      print("Falha ao Comunicar com a API da Prefeitura");
      // print(e);
    }
  }

  void aplicaFiltros() {
    Modular.to.pop();
  }
}
