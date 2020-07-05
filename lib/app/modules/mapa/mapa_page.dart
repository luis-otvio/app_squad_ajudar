import 'package:app_squad_ajudar/app/models/tipo_coleta.dart';
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
            child: IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => _filtrarPontos(),
                  );
                }),
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
                  ? Container(
                      child: Text("Carregando Mapa... Por favor aguarde!"),
                    )
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
                        width: MediaQuery.of(context).size.width,
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
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: controller.markers,
      minMaxZoomPreference: const MinMaxZoomPreference(12, 17),
      initialCameraPosition: const CameraPosition(
        target: LatLng(
            -19.740653, // this.controller.position.latitude,
            -45.254100 // this.controller.position.longitude,
            ),
        zoom: 13.0,
      ),
      onMapCreated: this.controller.onMapCreated,
    );
  }

  Widget _card() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Observer(
              builder: (_) => Text(this.controller.pontoColeta.nome),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: this.controller.hideCardDetalhado,
            ),
          ),
          Column(
              children: this.controller.pontoColeta.diasSemana.map((diaSemana) {
            return ListTile(
              leading: Image(
                image: AssetImage(
                    "assets/marker_icons/${diaSemana['icon'] ?? 'garbage'}.png"),
                height: 24,
                fit: BoxFit.cover,
              ),
              title: Text(diaSemana['diaSemanda'] ?? "Dia Semana"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Horario Inicio: ${diaSemana['horaInicio']}"),
                  Text("Tipo Coleta: ${diaSemana['tipoColeta']}"),
                  Divider()
                ],
              ),
            );
          }).toList())
        ],
      ),
    );
  }

  Dialog _filtrarPontos() {
    
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text("Filtros"),
              trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Modular.to.pop(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Observer(builder: (_) {
                if (this.controller.tipoColetaList.hasError) {
                  return Text("Ops, algo deu errado! :/");
                }

                if (this.controller.tipoColetaList.data == null) {
                  return Center(child: CircularProgressIndicator());
                }

                List<TipoColeta> tiposColeta =
                    this.controller.tipoColetaList.data;

                if (tiposColeta.length == 0) {
                  return Text("Filtros não carregado");
                }

                return ListView.builder(
                  itemCount: tiposColeta.length,
                  itemBuilder: (_, index) {
                    TipoColeta model = tiposColeta[index];
                    return ListTile(
                      leading: Image(
                        image: AssetImage(
                            "assets/marker_icons/${model.icon ?? 'garbage'}.png"),
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      title: Text(model.nome),
                      trailing: Checkbox(
                        value: model.checked,
                        onChanged: (value) {
                          model.checked = !value;
                        },
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () => this.controller.aplicaFiltros(),
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
