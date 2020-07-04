import 'package:mobx/mobx.dart';

part 'sugestoes_controller.g.dart';

class SugestoesController = _SugestoesControllerBase with _$SugestoesController;

abstract class _SugestoesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
