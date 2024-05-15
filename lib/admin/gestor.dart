import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/admin/agregar.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;

class Gestor extends StatefulWidget {
  final List<Map<String, dynamic>> hotelRows;
  const Gestor({required this.hotelRows, Key? key}) : super(key: key);

  @override
  State<Gestor> createState() => _GestorState();
}

class _GestorState extends State<Gestor> {
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Agregar()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: cons.colorSecundario,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  fixedSize: Size(size.width * 0.6, 25)),
              child: const Text(
                'Agregar',
                style: TextStyle(color: cons.negro, fontSize: 20),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
