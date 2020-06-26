import 'package:cloud_firestore/cloud_firestore.dart';

class ColetaModel {
  DocumentReference reference;
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

  Future save() async {
    if (reference == null) {
      // add
      reference = await Firestore.instance.collection('Coleta').add({
        'dia': dia,
        'pontoColeta': pontoColeta,
        'tipoColeta': tipoColeta,
      });
    } else {
      // update
      reference.updateData({
        'dia': dia,
        'pontoColeta': pontoColeta,
        'tipoColeta': tipoColeta,
      });
    }
  }
}
