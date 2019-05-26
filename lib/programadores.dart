import 'package:flutter/material.dart';
import 'main.dart';
class programadores extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text("Programadores", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(30.0),
                          width: 150,
                          height: 150,
                          child: CircleAvatar(backgroundImage: AssetImage('assets/images/yo.jpg'))
                      ),
                      Container(
                          padding: EdgeInsets.all(30.0),
                          width: 150,
                          height: 150,
                          child: CircleAvatar(backgroundImage: AssetImage('assets/images/edgar.jpeg'))
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Text("Camila Villamizar y Edgar Calderon son estudiantes de quinto semestre de ingeniería de sistemas en la Universidad"
                      " Tecnológica de Bolívar. Con 19 y 18 años respectivamente, sueñan con crear miles de aplicaciones que "
                      "puedan dar solución a problemas actuales y/o facilitar la vida de los demás.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}