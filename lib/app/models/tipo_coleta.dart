import 'package:cloud_firestore/cloud_firestore.dart';

class TipoColeta {
  DocumentReference reference;
  String cor;
  String descricao;
  String nome;
  String prefixo;
  String icon;
  bool checked;

  TipoColeta({
    this.reference,
    this.cor,
    this.descricao,
    this.nome,
    this.prefixo,
    this.icon,
    this.checked = true,
  });

  factory TipoColeta.fromDocument(DocumentSnapshot doc) {
    return TipoColeta(
      reference: doc.reference,
      cor: doc['cor'],
      descricao: doc['descricao'],
      nome: doc['nome'],
      prefixo: doc['prefixo'],
      icon: doc['icon'],
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      await Firestore.instance.collection(this.toString()).add({
        'cor': cor,
        'descricao': descricao,
        'nome': nome,
        'prefixo': prefixo,
        'icon': icon,
      });
    } else {
      // update
      await reference.updateData({
        'cor': cor,
        'descricao': descricao,
        'nome': nome,
        'prefixo': prefixo,
        'icon': icon,
      });
    }
  }

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}
