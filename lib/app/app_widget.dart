import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// cor verde customizada
Map<int, Color> color = {
  50: Color.fromRGBO(23, 177, 123, .1),
  100: Color.fromRGBO(23, 177, 123, .2),
  200: Color.fromRGBO(23, 177, 123, .3),
  300: Color.fromRGBO(23, 177, 123, .4),
  400: Color.fromRGBO(23, 177, 123, .5),
  500: Color.fromRGBO(23, 177, 123, .6),
  600: Color.fromRGBO(23, 177, 123, .7),
  700: Color.fromRGBO(23, 177, 123, .8),
  800: Color.fromRGBO(23, 177, 123, .9),
  900: Color.fromRGBO(23, 177, 123, 1),
};

class AppWidget extends StatelessWidget {
  MaterialColor greenCustom = MaterialColor(0xFF880E4F, color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Squad Ajudar',
      theme: ThemeData(
        primarySwatch: greenCustom,
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

generateAppBar(String titulo, Widget action) {
  // se houver botões a direita
  if (action != null) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(titulo),
      centerTitle: true,
      actions: [action],
    );
  } else {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        titulo,
        style: TextStyle(color: Colors.black),
      ),
      iconTheme: new IconThemeData(color: Colors.black),
      centerTitle: true,
    );
  }
}

Widget generateHomeButton(String texto, String iconeUrl) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                iconeUrl,
                height: 50,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 47,
                width: 2,
                color: Colors.grey,
              ),
            ],
          ),
          Text(
            texto,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002904),
            ),
          ),
        ],
      ),
    ),
  );
}
