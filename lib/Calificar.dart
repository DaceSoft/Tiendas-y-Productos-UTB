import 'main.dart';
import 'InformacionTiendas.dart';
import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class calificacion extends StatefulWidget {
  Tienda a = new Tienda();
  calificacion(this.a);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return calificar(a);
  }
}

class calificar extends State<calificacion> {

  double rating = 0.0;
  Tienda a = new Tienda();
  calificar(this.a);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "${a.nombre}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Por favor, digite su información: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ingrese su nombre",
                        icon: Icon(Icons.account_circle),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ingrese su correo electrónico",
                        icon: Icon(Icons.mail_outline),
                      ),
                    ),
                  ),
                  Text(
                    "\nCalifique la tienda: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        rating = v;
                        print("${rating}");
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 40.0,
                      color: Colors.amber,
                      borderColor: Colors.amber,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue[700])),
                    child: SizedBox(
                      height: 300,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Comentarios'
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

