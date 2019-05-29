import 'package:flutter/material.dart';
import 'main.dart';
import 'MyApp.dart';
import 'Calificar.dart';
import 'Clases.dart';


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
          backgroundColor: Colors.blue[900],
        title: Text("Tiendas UTB", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Tienda.Tiendas.length,
          itemBuilder: (BuildContext context, int index){
            return Center(
              child: Card(
                child: Container(
                  child: ListTile(
                    title: Text(
                      "${Tienda.Tiendas[index].nombre}",
                      style: TextStyle(color: Colors.blue[700], fontFamily: 'Acme', fontSize: 30)
                    ),
                    onTap: (){
                      print(Tienda.Tiendas.length);
                      print(index);
                      resenas(Tienda.Tiendas[index].id);
                      Tienda.Tiendas[index].calificacion = calificaciondelatienda(Tienda.Tiendas[index].id);//////////////////
                      Productosdetienda(index+1);
                      
                      for (var x in Producto.ProductosenTienda)
                      {
                        print (x.nombre_pro);
                      }


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
                        color: Colors.blue[800],
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(width: 180,height: 300,child: Column(
                          children: <Widget>[
                            Text(
                              "CALIFICACIÓN",
                              style: TextStyle(color: Colors.red, fontSize: 20, ),
                            ),
                            Text(
                              "${Ti.calificacion.toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "\nHORARIO ",
                              style: TextStyle(color: Colors.red, fontSize: 20, ),
                            ),
                            Text(
                              "${Ti.horario}",
                              style: TextStyle(fontSize: 17),
                            ),
                            Text(
                              "\nUBICACIÓN ",
                              style: TextStyle(color: Colors.red, fontSize: 20,),
                            ),
                            Text(
                              "${Ti.ubicacion}",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),),
                      )
                    ],
                  ),
                  Text("PRODUCTOS", style: TextStyle(color: Colors.red, fontSize: 20),),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue,
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
                  ),
                  Text("\nRESEÑAS ", style: TextStyle(color: Colors.red, fontSize: 20)),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue,
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
                                        "${persona.personasdetiendas[index].nombre}",
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

    print("El id ${Producto.Productos[c].id_tienda} = $a?");
    if(Producto.Productos[c].id_tienda == a){
      print("El id ${Producto.Productos[c].id_tienda} = $a?");
      Producto.ProductosenTienda.add(Producto.Productos[c]);
    }
  }
}

double calificaciondelatienda(int a){
  double puntaje = 0;
  int num = 0;
  for (int i = 0; i<resena.resenas.length; i++){
    if(resena.resenas[i].id_tien == a){
      puntaje += resena.resenas[i].puntuacion;
      num+=1;
    }
  }
  puntaje = puntaje/num;
  return puntaje;

}

void resenas (int a){
  resena.resenasdetiendas.clear();
  persona.personasdetiendas.clear();
  for (int i=0; i<resena.resenas.length; i++){
    if (resena.resenas[i].id_tien == a){
      resena.resenasdetiendas.add(resena.resenas[i]);
      for (int j=0; j<persona.personas.length; j++){
        if (persona.personas[j].id == resena.resenas[i].id_per){
          persona.personasdetiendas.add(persona.personas[j]);
        }
      }
    }
  }
}