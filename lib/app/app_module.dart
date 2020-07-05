import 'package:app_squad_ajudar/app/app_controller.dart';
import 'package:app_squad_ajudar/app/modules/admin/admin_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_squad_ajudar/app/app_widget.dart';
import 'package:app_squad_ajudar/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/admin', module: AdminModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
