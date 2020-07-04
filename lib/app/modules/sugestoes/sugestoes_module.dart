import 'package:app_squad_ajudar/app/modules/sugestoes/sugestoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/sugestoes/sugestoes_page.dart';

class SugestoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SugestoesController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SugestoesPage()),
      ];

  static Inject get to => Inject<SugestoesModule>.of();
}
