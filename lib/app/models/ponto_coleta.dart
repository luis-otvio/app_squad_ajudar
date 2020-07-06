import 'package:cloud_firestore/cloud_firestore.dart';

class PontoColeta {
  DocumentReference reference;
  String nome;
  String descricao;
  String icon;
  GeoPoint geoPoint;
  List<dynamic> diasSemana;
  bool ativo;

  PontoColeta({reference, nome, descricao, geoPoint, diasSemana, ativo, icon}) {
    this.reference = reference;
    this.nome = nome ?? "";
    this.descricao = descricao ?? "";
    this.geoPoint = geoPoint ?? GeoPoint(-19.740653, -45.254100);
    this.diasSemana = diasSemana;
    this.ativo = ativo ?? false;
    this.icon = icon;
  }

  factory PontoColeta.fromDocument(DocumentSnapshot doc) {
    return PontoColeta(
      reference: doc.reference,
      nome: doc['nome'],
      descricao: doc['descricao'],
      icon: doc['icon'] ?? "",
      geoPoint: doc['geoPoint'],
      diasSemana: doc['diasSemana'] ?? List<Map>(),
      ativo: doc['ativo'] ?? false,
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      await Firestore.instance.collection(this.toString()).add({
        'nome': nome,
        'descricao': descricao,
        'icon': icon,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diasSemana': diasSemana,
        'ativo': ativo,
      });
    } else {
      // update
      await reference.updateData({
        'nome': nome,
        'descricao': descricao,
        'icon': icon,
        'geoPoint': geoPoint ?? GeoPoint(-19.740653, -45.254100),
        'diasSemana': diasSemana,
        'ativo': ativo,
      });
    }
  }

  Future delete() async {
    if (reference != null) {
      await reference.delete();
    }
  }

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}
