import 'main.dart';
import 'InformacionTiendas.dart';
import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:productosutb/Clases.dart';

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
  TextEditingController nombreper = new TextEditingController();
  TextEditingController correoper = new TextEditingController();
  TextEditingController comentper = new TextEditingController();

  double rating = 0.0;
  Tienda a = new Tienda();

  calificar(this.a);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text(
            "${a.nombre}",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
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
                      controller: nombreper,
                      autofocus: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Ingrese su correo electrónico",
                        icon: Icon(Icons.mail_outline),
                      ),
                      controller: correoper,
                      autofocus: true,
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
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue[700])),
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: TextField(
                        maxLines: 30,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Comentarios'),
                        controller: comentper,
                        autofocus: true,
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(30.0),
                      child: SizedBox(
                        width: 100,
                        height: 60,
                        child: RaisedButton(
                          child: Text("Enviar",
                              style:
                                  TextStyle(fontFamily: 'Acme', fontSize: 22)),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.blue[700],
                          elevation: 20.0,
                          colorBrightness: Brightness.dark,
                          onPressed: () {
                            print("envio");

                            if (nombreper == "" ||
                                correoper == "" ||
                                rating == 0) {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("¡Atención!"),
                                      content: Text(
                                          "Por favor digite todos los campos."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            } else if ((comentper.text).contains("maldito") ||
                                (comentper.text).contains("hijueputa") ||
                                (comentper.text).contains("hp") ||
                                (comentper.text).contains("mierda")) {
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("¡ATENCIÓN!"),
                                      content: Text(
                                          "Por favor corrija su vocabulario."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            } else if((correoper.text).contains("@gmail.com")||
                                (correoper.text).contains("@utb.edu.co")||
                                (correoper.text).contains("@hotmail.com")||
                                (correoper.text).contains("@outlook.com")){
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Gracias"),
                                      content:
                                          Text("Tu reseña ha sido enviada."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Data.addResena(nombreper.text, correoper.text, a.id, comentper.text, rating.toInt());
                                            calificaciondelatienda(a.id);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }

                            else{
                              return showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Dirección de correo no válida"),
                                      content: Text(
                                          "Por favor verifique su correo electrónico."),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          },
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}

class resena {
  int id_resena;
  int id_tien;
  int puntuacion;
  String comentario, nombre, correo;
  resena(
      [this.id_resena,
      this.puntuacion,
      this.comentario,
      this.id_tien,
      this.nombre,
      this.correo]);
  static List<resena> resenas = new List<resena>();
  static List<resena> resenasdetiendas = new List<resena>();
}
