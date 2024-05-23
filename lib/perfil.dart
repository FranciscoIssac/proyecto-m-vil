import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/busqueda.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:image_picker/image_picker.dart';
import 'package:proyecto_hoteles/database_helper.dart';
import 'dart:io';

import 'home.dart';

class Perfil extends StatefulWidget {
  final Map<String, dynamic> dataUser;
  final List<Map<String, dynamic>> hotelRows;

  const Perfil({required this.dataUser, required this.hotelRows, Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late File imagen = File('imagenes/user2.png');
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Inicializa la imagen con la imagen predeterminada o la imagen actual del usuario
    imagen = widget.dataUser['image'] != null
        ? File(widget.dataUser['image'])
        : File('imagenes/user2.png');
  }

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
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(0),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                                          if (pickedFile != null) {
                                            setState(() {
                                              imagen = File(pickedFile.path); // Actualiza la imagen seleccionada
                                            });
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text("Seleccionar foto", style: TextStyle(fontSize: 16),),
                                              ),
                                              Icon(Icons.image, color: Colors.blue,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              color: Colors.red
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text("Cancelar", style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage:
                            imagen.existsSync() ? FileImage(imagen) : AssetImage('imagenes/user2.png') as ImageProvider,
                          radius: 55,
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
                                hotelRows: widget.hotelRows,
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
