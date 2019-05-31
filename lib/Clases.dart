import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';
import 'InformacionTiendas.dart';
import 'Calificar.dart';
import 'MyApp.dart';


class Data
{
  static Future<bool> getData() async
  {

    bool tiendas,productos;

    tiendas = await getTiendas();

    productos = await getProductos();

    if(tiendas && productos)
      return true;

    return false;



  }




  static Future<bool> getTiendas() async

  {
    try{



      var dataTiendas = await http.get(
          "http://edgar-calderon.com/tiendas/tiendas.php");


      var t = json.decode(dataTiendas.body);


      Tienda.Tiendas.clear();

      for (var x in t) {
        Tienda.Tiendas.add(
            Tienda(x["id_tienda"], x["nombre"], x["horario"], x["ubicacion"], "http://edgar-calderon.com/tiendas/Recursos/Imagenes/Tiendas/${x["imagen"]}"));
      }


      return true;
    }

    catch(e)
    {
      return false;
    }


  }


  static Future<bool> getProductos() async

  {

    try
    {

      var dataProductos = await http.get(
          "http://edgar-calderon.com/tiendas/productos.php");



      var p = json.decode(dataProductos.body);


      Producto.Productos.clear();



      for (var x in p) {


        Producto.Productos.add(Producto(int.parse(x["id_producto"]),int.parse( x["id_tienda"]), x["nombre"],
            int.parse(x["precio"]), x["descripcion"]));
      }




      return true;


    }


    catch(e)
    {
      print("catch: $e");
      return false;
    }


  }



  static Future<bool> getResenas() async
  {
    try
    {
      var dataProductos = await http.get(
          "http://edgar-calderon.com/tiendas/resenas.php");
      var p = json.decode(dataProductos.body);
      resena.resenas.clear();
      for (var x in p) {
        resena.resenas.add(resena(x["id_resena"], x["puntaje"],x["comentario"], x["id_tienda"],
            x["nombre"], x["correo"]));
      }
      return true;
    }
    catch(e)
    {
      print("catch: $e");
      return false;
    }




  }
//PARA ENVIAR LA RESEÑA EN LA BASE DE DATOS Data.addResena()
  static Future<bool> addResena(String nombre, String correo, int id_tienda, String comentario, int puntaje) async
  {
    try
    {
      var dataProductos = await http.post(
          "http://edgar-calderon.com/tiendas/resenas.php",headers: {'Content-Type' : 'application/json'},body: jsonEncode(
          {"nombre" : "$nombre", "correo" : "$correo", "id_tienda" : id_tienda, "comentario" : "$comentario", "puntaje" : puntaje}
      ));
      resena.resenas.add(resena(resena.resenas.length+1,puntaje,comentario,id_tienda,nombre,correo));
      return true;
    }
    catch(e)
    {
      print("catch: $e");
      return false;
    }




  }



}

