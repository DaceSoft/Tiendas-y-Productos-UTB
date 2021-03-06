import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'BuscarProductos.dart';
import 'InformacionTiendas.dart';
import 'programadores.dart';

class myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp();
  }
}

class MyApp extends State<myapp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/utb.jpg'),
            ),
            ListTile(
              title: Text("Inicio"),
              leading: Icon(Icons.home, color: Colors.blue[700],),
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/screen1', (Route<dynamic> route) => false);
              },
            ),
            ListTile(
              title: Text("Acerca de los programadores"),
              leading: Icon(Icons.account_circle, color: Colors.blue[700]),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> programadores()));
              },
            ),
          ],
        )
      ),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "Tiendas Y Productos UTB",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 400,
                  height: 150,
                  child: Image.asset('assets/images/cafeteria.png'),
                ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Elija una opción:",
                            style: TextStyle( fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          width: 200,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width: 300,
                                    height: 60,
                                    child: RaisedButton(
                                      child: Text("Buscar Producto", style: TextStyle(fontFamily: 'Acme', fontSize: 30, color: Colors.white), ),
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                      color: Colors.blue[700],
                                      elevation: 20.0,
                                      colorBrightness: Brightness.light,
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> buscarproductos()));
                                      },
                                    ),
                                  )
                              ),
                              Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width: 300,
                                    height: 60,
                                    child: RaisedButton(
                                      child: Text("Información de Tiendas", style: TextStyle(fontFamily: 'Acme', fontSize: 22)),
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                      color: Colors.blue[700],
                                      elevation: 20.0,
                                      colorBrightness: Brightness.dark,
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> infotiendas()));
                                      },
                                    ),
                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                //DATOS DE PRUEBA

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Tienda {
  int id;
  String nombre, horario, ubicacion;
  String foto;
  double calificacion;
  Tienda([this.id, this.nombre, this.horario, this.ubicacion, this.foto]);
  static List<Tienda> Tiendas = List<Tienda>();
  static List<Tienda> Tbuscadas = new List<Tienda>();

}

class Producto{
  int id_producto;
  int id_tienda;
  String nombre_pro, descripcion;
  int precio;
  Producto([this.id_producto,this.id_tienda, this.nombre_pro, this.precio, this.descripcion]);
  static List<Producto> Productos = List<Producto>();
  static List<Producto> Pbuscados = new List <Producto>();
  static List<Producto> ProductosenTienda = new List <Producto>();
}


