import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'como_separar_controller.g.dart';

class ComoSepararController = _ComoSepararControllerBase
    with _$ComoSepararController;

abstract class _ComoSepararControllerBase with Store {
  final Firestore firestore = Firestore.instance;

  _DicaLocalControllerBase() {
    // getList()
  }
}
