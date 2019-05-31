import 'package:flutter/material.dart';
import 'dart:async';
import 'MyApp.dart';
import 'BuscarProductos.dart';
import 'Calificar.dart';
import 'programadores.dart';
import 'Clases.dart';



void main() async{

  bool connected = await Data.getData();

  runApp(MaterialApp(
  home: myhomepage(),
  routes: <String, WidgetBuilder>{
    '/screen1': (BuildContext context) => myapp(),
    '/screen2': (BuildContext context) => programadores(),
  },
  // ignore: argument_type_not_assignable
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
));





} 

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
    super.initState();
    Timer(Duration(seconds: 3), () =>
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/screen1', (Route<dynamic> route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent1(),
    );
  }
}

Widget _buildContent1(){
  return Center(
        child: Image.asset('assets/images/logo.png'),
  );
}


