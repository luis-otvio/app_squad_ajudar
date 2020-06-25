import 'package:app_squad_ajudar/app/modules/mapa/models/coleta_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'mapa_controller.dart';

class MapaPage extends StatefulWidget {
  final String title;
  const MapaPage({Key key, this.title = "Pontos de Coleta"}) : super(key: key);

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends ModularState<MapaPage, MapaController> {
  @override
  void initState() {
    super.initState();
    this.controller.getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.coletaList.hasError) {
          return Center(
            child: RaisedButton(
                onPressed: controller.getList, child: Text("Error")),
          );
        }

        if (controller.coletaList.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        List<ColetaModel> list = controller.coletaList.data;

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, index) {
            ColetaModel model = list[index];
            return Card(
              child: Column(
                children: [
                  Text(model.tipoColeta.toString()),
                  Text(model.dia.toString()),
                  Text("${model.pontoColeta.latitude}, ${model.pontoColeta.longitude}")
                ],
              ),
            );
          },
        );
      }),
      /*       
      Stack(
        children: [
          Observer(
            builder: (_) => controller.mapToggle
                ? this._googleMap()
                : Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando Mapa... Por favor aguarde!'),
                      ],
                    ),
                  ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Observer(
              builder: (_) => !this.controller.mapToggle
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
     */
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
            title: Text(this.controller.cardTitle),
            trailing: IconButton(
                icon: this.controller.cardIcon,
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
                    this.controller.cardContent,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(this.controller.cardDiaSemana),
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
