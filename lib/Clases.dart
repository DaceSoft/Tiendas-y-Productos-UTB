
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
          Tienda(x["id"], x["nombre"], x["horario"], x["ubicacion"], ""));
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
    

        Producto.Productos.add(Producto(x["id_producto"], x["id_tienda"], x["nombre"],
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




}








