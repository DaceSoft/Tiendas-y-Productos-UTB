import 'package:flutter/material.dart';
import 'main.dart';
import 'MyApp.dart';
import 'Calificar.dart';
import 'Clases.dart';

class infotiendas extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InformacionTiendas();
  }
}

class InformacionTiendas extends State<infotiendas> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "Tiendas UTB",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: Tienda.Tiendas.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Card(
                child: Container(
                    child: ListTile(
                  title: Text(
                    "${Tienda.Tiendas[index].nombre}",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  leading: Container(
                    width: 55,
                      height: 55,
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(Tienda.Tiendas[index].foto)
                        ),
                        backgroundColor: Colors.transparent,
                      )
                  ),/////////////////
                  onTap: () {
                    print(Tienda.Tiendas.length);
                    print(index);
                    resenastiendas(Tienda.Tiendas[index].id);
                    Tienda.Tiendas[index].calificacion = calificaciondelatienda(Tienda.Tiendas[index].id); //////////////////
                    Productosdetienda(Tienda.Tiendas[index].id);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyTabs(Tienda.Tiendas[index])));
                  },
                )),
              ));
            }));
  }
}

//Metodo que pertenezca a una clase.
class MyTabs extends StatefulWidget {
  Tienda Ti;
  MyTabs(this.Ti);
  @override
  _MyTabsState createState() => _MyTabsState(Ti);
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  Tienda Ti;
  _MyTabsState(this.Ti);
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          title: Text(
            "${Ti.nombre}",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.info),
                text: "Información",
              ),
              Tab(
                icon: Icon(Icons.monetization_on),
                text: "Productos",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Reseñas",
              )
            ],
            controller: controller,
          ),
        ),
        body: TabBarView(children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 400,
                        height: 150,
                      child: Image.network(Ti.foto)/////////////////////////////////////////////
                    ),
                    Row(
                      children: <Widget>[
                        Text("CALIFICACIÓN", style: TextStyle(fontSize: 20, color: Colors.red),),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: SizedBox(
                              width: 100,
                              height: 20,
                              child: Text(
                                "${Ti.calificacion}",
                                textAlign: TextAlign.center,
                              )),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("HORARIO", style: TextStyle(fontSize: 20, color: Colors.red),),
                        Container(
                          padding: EdgeInsets.all(30.0),
                          child: SizedBox(
                              width: 150,
                              height: 20,
                              child: Text("${Ti.horario}",
                                  textAlign: TextAlign.center)),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("UBICACIÓN", style: TextStyle(fontSize: 20, color: Colors.red),),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: SizedBox(
                              width: 140,
                              height: 20,
                              child: Text(
                                "${Ti.ubicacion}",
                                textAlign: TextAlign.justify,
                              )),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(40),
                      child: SizedBox(
                        width: 200,
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
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            width: 300,
            height: 300,
            child: Card(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Producto.ProductosenTienda.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Card(
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "${Producto.ProductosenTienda[index].nombre_pro}",
                                style: TextStyle(
                                  fontFamily: 'Acme',
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                  "${Producto.ProductosenTienda[index].descripcion}"),
                              trailing: Text(
                                  "\$${Producto.ProductosenTienda[index].precio}",
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 40,
                                      color: Colors.red[700])),
                            ),
                          ),
                        ),
                      );
                    })),
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.grey[200],
            child: Card(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: resena.resenasdetiendas.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Card(
                          child: Container(
                            child: ListTile(
                              title: Text(
                                "hla",//${persona.personasdetiendas[index].nombre}
                                style: TextStyle(fontFamily: 'Acme', fontSize: 20, color: Colors.red[700]),
                              ),
                              subtitle: Text(
                                  "${resena.resenasdetiendas[index].comentario}"
                              ),
                              trailing: Text(
                                  "${resena.resenasdetiendas[index].puntuacion}",
                                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 40, color: Colors.amber)
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                )
            ),
          ),
        ], controller: controller));
  }
}

void Productosdetienda(int a) {
  Producto.ProductosenTienda.clear();
  for (int c = 0; c < Producto.Productos.length; c++) {
    if (Producto.Productos[c].id_tienda == a) {
      Producto.ProductosenTienda.add(Producto.Productos[c]);
    }
  }
}

double calificaciondelatienda(int a) {
  double puntaje = 0;
  int num = 0;
  for (int i = 0; i < resena.resenas.length; i++) {
    if (resena.resenas[i].id_tien == a) {
      puntaje += resena.resenas[i].puntuacion;
      num += 1;
    }
  }
  puntaje = puntaje / num;
  return puntaje;
}


void resenastiendas (int a){
  print("Las resenas son: ");
  for (var x in resena.resenas){
    print(x.nombre);
  }
  print("Esas son todas las reseñas");

  resena.resenasdetiendas.clear();
  for (int i = 0; i< resena.resenas.length; i++){
    if (resena.resenas[i].id_tien == a){
      resena.resenasdetiendas.add(resena.resenas[i]);
    }
  }
}

