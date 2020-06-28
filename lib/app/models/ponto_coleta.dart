import 'package:cloud_firestore/cloud_firestore.dart';

class PontoColeta {
  DocumentReference reference;
  String nome;
  String descricao;
  GeoPoint geoPoint;
  Map<dynamic, dynamic> diaSemana;

  PontoColeta({reference, nome, descricao, geoPoint, diaSemana}) {
    this.reference = reference;
    this.nome = nome ?? "";
    this.descricao = descricao ?? "";
    this.geoPoint = geoPoint ?? GeoPoint(-19.740653, -45.254100);
    this.diaSemana = diaSemana ?? {};
  }

  factory PontoColeta.fromDocument(DocumentSnapshot doc) {
    return PontoColeta(
      reference: doc.reference,
      nome: doc['nome'],
      descricao: doc['descricao'],
      geoPoint: doc['geoPoint'],
      diaSemana: doc['diaSemana'],
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      await Firestore.instance.collection(this.toString()).add({
        'nome': nome,
        'descricao': descricao,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diaSemana': diaSemana,
      });
    } else {
      // update
      await reference.updateData({
        'nome': nome,
        'descricao': descricao,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diaSemana': diaSemana,
      });
    }
  }

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}
