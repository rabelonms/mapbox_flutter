import 'package:flutter/material.dart';
import 'package:mapbox_flutter/src/views/fullscreeenmap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, top: 20),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Recycling_symbol.svg/1047px-Recycling_symbol.svg.png',
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20),
                  child: Text("Localizar ecopontos",
                      style: TextStyle(color: Colors.green[900], fontSize: 23)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, top: 20),
                  child: Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green[50],
          ),
        ),
        body: FullScreenMap(),
      ),
    );
  }
}
