import 'package:cloud_firestore/cloud_firestore.dart';

class Coleta {
  DocumentReference reference;
  Map dia;
  GeoPoint pontoColeta;
  List tipoColeta;

  Coleta({this.reference, this.dia, this.pontoColeta, this.tipoColeta});

  factory Coleta.fromDocument(DocumentSnapshot doc) {
    return Coleta(
      reference: doc.reference,
      dia: doc['dia'],
      pontoColeta: doc['pontoColeta'],
      tipoColeta: doc['tipoColeta'],
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      reference = await Firestore.instance.collection(this.runtimeType.toString()).add({
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
