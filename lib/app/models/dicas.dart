import 'package:cloud_firestore/cloud_firestore.dart';

class Dicas {
  DocumentReference reference;
  String titulo;
  String descricao;
  String url;

  Dicas({reference, titulo, descricao, url}) {
    this.reference = reference;
    this.titulo = titulo ?? "";
    this.descricao = descricao ?? "";
    this.url = url;
  }

  factory Dicas.fromDocument(DocumentSnapshot doc) {
    return Dicas(
      reference: doc.reference,
      titulo: doc['titulo'],
      descricao: doc['descricao'],
      url: doc['url'] ?? "",
    );
  }

  Future save() async {
    if (reference == null) {
      // add
      await Firestore.instance.collection(this.toString()).add({
        'titulo': titulo,
        'descricao': descricao,
        'url': url,
      });
    } else {
      // update
      await reference.updateData({
        'titulo': titulo,
        'descricao': descricao,
        'url': url,
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
