import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'dica_local_controller.g.dart';

class DicaLocalController = _DicaLocalControllerBase with _$DicaLocalController;

abstract class _DicaLocalControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _DicaLocalControllerBase() {
    // getList()
  }
}
