import 'package:flutter/material.dart';
import 'dart:async';
import 'MyApp.dart';
import 'BuscarProductos.dart';

void main() => runApp(MaterialApp(
  home: myhomepage(),
  routes: <String, WidgetBuilder>{
    '/screen1': (BuildContext context) => myapp(),
  },
  // ignore: argument_type_not_assignable
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
));

class myhomepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return splash();
  }
}

class splash extends State<myhomepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () =>
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/screen1', (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _buildContent1(),
    );
  }
}

Widget _buildContent1(){
  inicialization();
  return Center(
        child: Image.asset('assets/images/logo.png'),
  );
}

void inicialization (){
  Image foto1 = Image.asset('assets/images/cafeteria.png');
  Image foto2 = Image.asset('assets/images/pandebono.jpg');

  Tienda Tienda1 = new Tienda(1, "Alcatraz", "L-V 7:00 AM a 6:00 PM", "Zona T", foto1);
  Tienda Tienda2 = new Tienda(2, "La esquina del pan de bono", "L-V 7:00 AM a 6:00 PM", "Zona T", foto2);
  Tienda Tienda3 = new Tienda(3, "Panaderia de juan fe", "L-V 7:00 AM a 6:00 PM", "Zona T", foto2);


  Tienda.Tiendas.add(Tienda1);
  Tienda.Tiendas.add(Tienda2);
  Tienda.Tiendas.add(Tienda3);

  Producto Producto0 = new Producto(1, "AGUA", "2000", "Agua en botella");
  Producto Producto1 = new Producto(2, "AGUA", "2000", "Agua en botella");
  Producto Producto2 = new Producto(2, "AGUA", "500", "Agua en vaso");
  Producto Producto3 = new Producto(3, "AGUA", "2000", "Agua en botella");
  Producto Producto4 = new Producto(3, "JUGO HIT", "2200", "jugo hit en botella");
  Producto Producto5 = new Producto(1, "JUGO HIT", "2200", "jugo hit en botella");

  Producto.Productos.add(Producto0);
  Producto.Productos.add(Producto1);
  Producto.Productos.add(Producto2);
  Producto.Productos.add(Producto3);
  Producto.Productos.add(Producto4);
  Producto.Productos.add(Producto5);


  Producto.Pbuscados.clear();
  Tienda.Tbuscadas.clear();
}
