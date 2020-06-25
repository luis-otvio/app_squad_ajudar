import 'package:cloud_firestore/cloud_firestore.dart';

class ColetaModel {
  final DocumentReference reference;
  Map dia;
  GeoPoint pontoColeta;
  List tipoColeta;

  ColetaModel({this.reference, this.dia, this.pontoColeta, this.tipoColeta});

  factory ColetaModel.fromDocument(DocumentSnapshot doc) {
    return ColetaModel(
      reference: doc.reference,
      dia: doc['dia'],
      pontoColeta: doc['pontoColeta'],
      tipoColeta: doc['tipoColeta'],
    );
  }
}
