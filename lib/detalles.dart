import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/home.dart';
import 'package:proyecto_hoteles/main.dart';
import 'package:proyecto_hoteles/perfil.dart';
import 'package:proyecto_hoteles/reservacion.dart';

class Detalles extends StatefulWidget {
  final Map<String, dynamic> dataUser;
  final Map<String, dynamic> dataHotel;

  const Detalles({required this.dataHotel, required this.dataUser, Key? key}) : super(key: key);

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print(widget.dataUser);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height * 0.1,
                color: cons.blanco,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        'Nombre_APP',
                        style: TextStyle(
                            color: cons.gris,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image(
                      image: AssetImage('imagenes/logo.png'),
                      height: 60,
                    ),
                  ],
                ),
              ),
              Container(
                color: cons.colorPrincipal,
                height: 5,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "${widget.dataHotel['name']}",
                        style: TextStyle(
                            color: cons.gris,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width * 0.9,
                        child: Column(
                          children: [
                            Text("${widget.dataHotel['description']}",
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: size.height * 0.02),
                            Text("Estamos en:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataHotel['location']}",
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: size.height * 0.02),
                            Text("Contáctanos:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataHotel['telephone']}",
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: size.height * 0.02),
                            Text("Precios:",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(
                                "Habitación sencilla: ${widget.dataHotel['priceS']}\n"
                                "Habitación doble: ${widget.dataHotel['priceD']}",
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: size.height * 0.02),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Reservacion(dataHotel: widget.dataHotel, dataUser: widget.dataUser,)));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cons.colorPrincipal,
                              ),
                              child: Text(
                                'Reservar',
                                style: TextStyle(
                                  color: cons.blanco,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                color: cons.colorSecundario,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () async {
                            final hotelRows = await hotelDBHelper.queryAllRows();

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home(
                                dataUser: widget.dataUser,
                                hotelRows: hotelRows,
                              )));},
                          icon: Icon(Icons.home),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () { },
                          icon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          onPressed: () async {
                            final hotelRows = await hotelDBHelper.queryAllRows();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Perfil(
                                  dataUser: widget.dataUser,
                                  hotelRows: hotelRows,
                                )));
                          },
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
