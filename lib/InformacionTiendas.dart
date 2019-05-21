import 'package:flutter/material.dart';
import 'main.dart';
import 'MyApp.dart';
import 'Calificar.dart';
class infotiendas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InformacionTiendas();
  }

}

class InformacionTiendas extends State<infotiendas>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[900]
      ),
      body: ListView.builder(
        itemCount: Tienda.Tiendas.length,
          itemBuilder: (BuildContext context, int index){
            return Center(
              child: Card(
                child: Container(
                  color: Colors.amber,
                  child: ListTile(
                    title: Text(
                      "${Tienda.Tiendas[index].nombre}",
                      style: TextStyle(color: Colors.red, fontFamily: 'Acme', fontSize: 30)
                    ),
                    onTap: (){
                      Productosdetienda(Tienda.Tiendas[index].id);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> infoTienda(Tienda.Tiendas[index])));
                    },
                  )
                ),
              )
            );
          }
      )
    );
  }
}

//Metodo que pertenezca a una clase.
class infoTienda extends StatelessWidget{

  Tienda Ti = new Tienda();
  infoTienda(this.Ti);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "${Ti.nombre}",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Ti.foto,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "HORARIO ",
                              style: TextStyle(color: Colors.red, fontSize: 20, fontFamily: 'Pacifico'),
                            ),
                            Text(
                              "${Ti.horario}",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "UBICACIÓN ",
                              style: TextStyle(color: Colors.red, fontSize: 20, fontFamily: 'Pacifico'),
                            ),
                            Text(
                              "${Ti.ubicacion}",
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Text("PRODUCTOS", style: TextStyle(color: Colors.red, fontSize: 20, fontFamily: 'Pacifico'),),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue,
                    child: Card(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: Producto.ProductosenTienda.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Card(
                                  child: Container(
                                    color: Colors.amberAccent,
                                    child: ListTile(
                                      title: Text(
                                        "${Producto.ProductosenTienda[index].nombre_pro}",
                                        style: TextStyle(fontFamily: 'Acme', fontSize: 20, color: Colors.red[700]),
                                      ),
                                      subtitle: Text(
                                          "${Producto.ProductosenTienda[index].descripcion}"
                                      ),
                                      trailing: Text(
                                          "${Producto.ProductosenTienda[index].precio}",
                                          style: TextStyle(fontFamily: 'Akronim', fontSize: 40, color: Colors.blue[700])
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                        )
                    ),
                  )
                ],
              )
          ),
          Container(
            padding: EdgeInsets.all(40),
            child: SizedBox(
              width: 100,
              height: 60,
              child:  RaisedButton(
                color: Colors.blue[700],
                child: Text(
                    "Calificar",
                    style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'Acme')),
                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                elevation: 20.0,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> calificacion(Ti)));
                },
              ),
            ),
          )
        ],
      )
    );
  }
}

void Productosdetienda(int a){
  Producto.ProductosenTienda.clear();
  for(int c=0; c<Producto.Productos.length; c++){
    if(Producto.Productos[c].id_tienda == a){
      Producto.ProductosenTienda.add(Producto.Productos[c]);
    }
  }
}