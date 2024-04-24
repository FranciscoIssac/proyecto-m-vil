import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/busqueda.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

import 'home.dart';

class Perfil extends StatefulWidget {
  final Map<String, dynamic> dataUser;

  const Perfil({required this.dataUser, Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                        "Perfil",
                        style: TextStyle(
                            color: cons.gris,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      ClipOval(
                        child: Image(
                          image: AssetImage('imagenes/user2.png'),
                          height: 110,
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width * 0.9,
                        child: Column(
                          children: [
                            Text("Usuario",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataUser['user']}",
                                style: TextStyle(fontSize: 18)),
                            Text("Nombre",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataUser['name']}",
                                style: TextStyle(fontSize: 18)),
                            Text("Correo electrónico",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataUser['mail']}",
                                style: TextStyle(fontSize: 18)),
                            Text("Teléfono",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("${widget.dataUser['tel']}",
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: size.height * 0.02),
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
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Home(
                                    dataUser: widget.dataUser,
                                  )));
                            },
                            icon: Icon(Icons.home),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Busqueda()));
                            },
                            icon: Icon(Icons.search),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                          )),
                    )
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
