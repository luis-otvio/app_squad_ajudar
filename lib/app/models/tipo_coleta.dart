import 'package:cloud_firestore/cloud_firestore.dart';

class TipoColeta {
  DocumentReference reference;
  String observacao;
  String tipo;
  String prefixo;

  TipoColeta({this.reference, this.observacao, this.tipo, this.prefixo});

  factory TipoColeta.fromDocument(DocumentSnapshot doc) {
    return TipoColeta(
      reference: doc.reference,
      observacao: doc['observacao'],
      tipo: doc['tipo'],
      prefixo: doc['prefixo'],
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      reference =
          await Firestore.instance.collection(this.runtimeType.toString()).add({
        'observacao': observacao,
        'tipo': tipo,
        'prefixo': prefixo,
      });
    } else {
      // update
      reference.updateData({
        'observacao': observacao,
        'tipo': tipo,
        'prefixo': prefixo,
      });
    }
  }
}
