import 'package:app_squad_ajudar/app/modules/dica_local/dica_local_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/dica_local/dica_local_page.dart';

class DicaLocalModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DicaLocalController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DicaLocalPage()),
      ];

  static Inject get to => Inject<DicaLocalModule>.of();
}
