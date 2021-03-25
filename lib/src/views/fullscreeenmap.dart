import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  final center = LatLng(-5.097678525919034, -38.370512421067744);

  MapboxMapController mapController;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    final ecoponto_1 = LatLng(-5.104767, -38.361620);
    final ecoponto_2 = LatLng(-5.105768947879323, -38.370635914091125);
    final ecoponto_3 = LatLng(-5.102943, -38.332237);
    final ecoponto_4 = LatLng(-5.111487562007704, -38.37276902402569);
    final ecoponto_5 = LatLng(-5.240646, -38.489271);
    final ecoponto_6 = LatLng(-5.102136979082704, -38.371592781499366);
    final ecoponto_7 = LatLng(-5.1063122751490955, -38.38998959555726);
    final ecoponto_8 = LatLng(-5.108395862977627, -38.37342190050543);
    final ecoponto_9 = LatLng(-5.107316680224821, -38.372494544073675);
    final ecoponto_10 = LatLng(-5.106128031578107, -38.36881160809891);
    final econponto_11 = LatLng(-5.095161550452087, -38.37183232322254);
    final econponto_12 = LatLng(-5.092102330318064, -38.36355225130113);
    final econponto_13 = LatLng(-5.0997275079970015, -38.36525755365794);
    final econponto_14 = LatLng(-5.091458767498941, -38.378751233285605);

    var ecopontos = [
      ecoponto_1,
      ecoponto_2,
      ecoponto_3,
      ecoponto_4,
      ecoponto_5,
      ecoponto_6,
      ecoponto_7,
      ecoponto_8,
      ecoponto_9,
      ecoponto_10,
      econponto_11,
      econponto_12,
      econponto_13,
      econponto_14
    ];

    for (var ecoponto in ecopontos) {
      mapController.addSymbol(
        SymbolOptions(
            geometry: ecoponto, iconImage: 'networkImage', iconSize: 0.080),
      );
    }
    _onStyleLoaded();
  }

  void _onStyleLoaded() {
    //addImageFromAsset("assetImage", "assets/symbols/custom-icon.png");
    addImageFromUrl(
        "networkImage",
        Uri.parse(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Recycling_symbol.svg/786px-Recycling_symbol.svg.png"));
  }

  /*
  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return mapController.addImage(name, list);
  }
*/
  /// Adds a network image to the currently displayed style
  Future<void> addImageFromUrl(String name, Uri uri) async {
    var response = await http.get(uri);
    return mapController.addImage(name, response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: createMap(), floatingActionButton: buttonsOnMap());
  }

  Column buttonsOnMap() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //zoom
        FloatingActionButton(
            child: Icon(
              Icons.zoom_in,
            ),
            backgroundColor: Colors.green,
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            }),

        SizedBox(
          height: 5,
        ),

        FloatingActionButton(
            child: Icon(Icons.zoom_out),
            backgroundColor: Colors.green,
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            }),

        SizedBox(
          height: 5,
        ),

        FloatingActionButton(
            child: Icon(Icons.center_focus_strong),
            backgroundColor: Colors.green,
            onPressed: () {
              mapController.animateCamera(CameraUpdate.newLatLng(center));
            }),
      ],
    );
  }

  MapboxMap createMap() {
    return MapboxMap(
      accessToken:
          'pk.eyJ1IjoibmNzcmJsIiwiYSI6ImNrbW02cTk4MTFobHYycXMyNWVxNHVxODkifQ.udIxiC6wjs0asnl5ZmkYdg',
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14.0),
    );
  }
}
