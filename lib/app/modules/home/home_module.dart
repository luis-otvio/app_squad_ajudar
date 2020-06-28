import 'package:app_squad_ajudar/app/modules/home/home_controller.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_controller.dart';
import 'package:app_squad_ajudar/app/modules/mapa/mapa_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_squad_ajudar/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => MapaController(Firestore.instance)),
      ];

  @override
  List<Router> get routers => [
        Router('', child: (_, args) => HomePage()),
        Router('/mapa', child: (_, args) => MapaPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
