import 'package:app_squad_ajudar/app/modules/como_separar/como_separar_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/como_separar/como_separar_page.dart';

class ComoSepararModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ComoSepararController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ComoSepararPage()),
      ];

  static Inject get to => Inject<ComoSepararModule>.of();
}
