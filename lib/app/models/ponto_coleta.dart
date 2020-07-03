import 'package:cloud_firestore/cloud_firestore.dart';

class PontoColeta {
  DocumentReference reference;
  String nome;
  String descricao;
  GeoPoint geoPoint;
  List<dynamic> diasSemana;

  PontoColeta({reference, nome, descricao, geoPoint, diasSemana}) {
    this.reference = reference;
    this.nome = nome ?? "";
    this.descricao = descricao ?? "";
    this.geoPoint = geoPoint ?? GeoPoint(-19.740653, -45.254100);
    this.diasSemana = diasSemana;
  }

  factory PontoColeta.fromDocument(DocumentSnapshot doc) {
    return PontoColeta(
      reference: doc.reference,
      nome: doc['nome'],
      descricao: doc['descricao'],
      geoPoint: doc['geoPoint'],
      diasSemana: doc['diasSemana'] ?? List<Map>(),
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      await Firestore.instance.collection(this.toString()).add({
        'nome': nome,
        'descricao': descricao,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diasSemana': diasSemana,
      });
    } else {
      // update
      await reference.updateData({
        'nome': nome,
        'descricao': descricao,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diasSemana': diasSemana,
      });
    }
  }

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}
