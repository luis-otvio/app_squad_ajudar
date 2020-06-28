import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../app_widget.dart';
import 'mapa_controller.dart';

class MapaPage extends StatefulWidget {
  final String title;
  const MapaPage({Key key, this.title = "Pontos de Coleta"}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends ModularState<MapaPage, MapaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(
          widget.title,
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.filter_list),
          )),
      body: Stack(
        children: [
          Observer(builder: (_) {
            if (controller.pontoColetaList.data != null) {
              controller.posicaoMarcacao();
            }

            return controller.exibeMapa
                ? this._googleMap()
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando Mapa... Por favor aguarde!'),
                      ],
                    ),
                  );
          }),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Observer(
              builder: (_) => !this.controller.exibeMapa
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: FloatingActionButton(
                                onPressed: this.controller.posicaoAtual,
                                tooltip: "Posição Atual",
                                child: Icon(Icons.gps_fixed),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
            ),
            Observer(
              builder: (_) => !this.controller.cardDetalhado
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 360,
                        child: _card(),
                      ),
                    ),
            )
          ])
        ],
      ),
    );
  }

  Widget _googleMap() {
    return GoogleMap(
      padding: const EdgeInsets.only(top: 66),
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: controller.markers,
      initialCameraPosition: CameraPosition(
        target: LatLng(
          this.controller.position.latitude,
          this.controller.position.longitude,
        ),
        zoom: 17.0,
      ),
      onMapCreated: this.controller.onMapCreated,
    );
  }

  Widget _card() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.map),
            title: Observer(
                builder: (_) => Text(this.controller.pontoColeta.nome)),
            trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: this.controller.hideCardDetalhado),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, bottom: 16.0, left: 16, right: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    "this.controller.cardContent",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(this.controller.pontoColeta.diaSemana.toString()),
                    Text("14:20"),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
