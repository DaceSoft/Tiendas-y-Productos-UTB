import 'main.dart';
import 'package:flutter/material.dart';
import 'MyApp.dart';

class buscarproductos extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Buscar();
  }

}

class Buscar extends State<buscarproductos>{

  String ProductoaBuscar = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: TextField(
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintText: "Ingrese nombre del producto",
          icon: Icon(Icons.search),
        ),
          onChanged: (String Value){

          ProductoaBuscar = Value;

          seleccion(ProductoaBuscar.toUpperCase());//touppercase: texto a mayuscula
          },
        ),
      ),

      body: _buildContent(),
      );

  }


  Widget _buildContent(){

    if (ProductoaBuscar.length == 0){
      return Container(
        child: Center(
          child: Text("Busque algun producto"),
        ),
      );
    }
    else if(Producto.Pbuscados.length==0){
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("No se ha encontrado ningún producto..."),
              Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/emoticon.png'),
              ),
            ],
          ),
        )

      );
    }
    else {
      return ListView.builder(
          itemCount: Producto.Pbuscados.length,
          itemBuilder: (BuildContext context, int index){
            return Center(
                child: Card(
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "${Producto.Pbuscados[index].nombre_pro}",
                          style: TextStyle(color: Colors.blue[700], fontSize: 30),
                        ),
                        subtitle: Column(
                          children: <Widget>[
                            Text(
                                "${Tienda.Tbuscadas[index].nombre}",
                                style: TextStyle(color: Colors.red,  fontSize: 20, fontFamily: 'Pacifico')
                            ),
                            Text(
                              "${Producto.Pbuscados[index].descripcion}",

                            )
                          ],
                        ),
                        trailing: Text(
                          "${Producto.Pbuscados[index].precio}",
                          style: TextStyle(fontSize: 50, fontFamily: 'Akronim', color: Colors.blueGrey),
                        ),
                      )
                    )
                )
            );

          }
      );
    }
  }
  void seleccion (String p) {

    //Creamos esto para eliminar toda la lista al inicio
    Producto.Pbuscados.clear();
    Tienda.Tbuscadas.clear();

    //Esta funcion identifica que producto contiene lo que se esta buscando y se agrega a 2 listas
    for (int i = 0; i<Producto.Productos.length; i++){
      if ((Producto.Productos[i].nombre_pro).contains(p)){
        Producto.Pbuscados.add(Producto.Productos[i]);
        for (int j = 0; j<Tienda.Tiendas.length; j++){
          if (Producto.Productos[i].id_tienda == Tienda.Tiendas[j].id){
            Tienda.Tbuscadas.add(Tienda.Tiendas[j]);
          }
        }
      }
    }
  }
}

