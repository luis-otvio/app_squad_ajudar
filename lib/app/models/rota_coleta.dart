import 'package:app_squad_ajudar/app/models/ponto_coleta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RotaColeta {
  DocumentReference reference;
  String descricao;
  PontoColeta pontoColeta;

  RotaColeta({
    this.reference,
    this.descricao,
    this.pontoColeta,
  });

  factory RotaColeta.fromDocument(DocumentSnapshot doc) {
    return RotaColeta(
      reference: doc.reference,
      descricao: doc['descricao'],
      pontoColeta: doc['pontoColeta'],
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      reference =
          await Firestore.instance.collection(super.toString()).add({
        'descricao': descricao,
        'pontoColeta': pontoColeta,
      });
    } else {
      // update
      reference.updateData({
        'descricao': descricao,
        'pontoColeta': pontoColeta,
      });
    }
  }
}
