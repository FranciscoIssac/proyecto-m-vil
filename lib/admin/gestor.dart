import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/admin/agregar.dart';
import 'package:proyecto_hoteles/admin/editar.dart';
import 'package:proyecto_hoteles/admin/reservaciones.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/main.dart';

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
      body: Column(
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
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Agregar()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cons.colorSecundario),
                  child: const Text(
                    'Agregar',
                    style: TextStyle(color: cons.negro, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    final reservacionRows = await reservacionDBHelper
                        .queryAllRows();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reservaciones(reservacionRows: reservacionRows,)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: cons.colorSecundario),
                  child: const Text(
                    'Reservaciones',
                    style: TextStyle(color: cons.negro, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            color: cons.colorPrincipal,
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.hotelRows.length,
              itemBuilder: (context, index) {
                final hotel = widget.hotelRows[index];
                return ListTile(
                  title: Text('Nombre: ${hotel['name']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Editar(hotel: hotel)));
                        },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('¿Desea borrarlo?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          hotelDBHelper.delete(hotel['_id']);
                                          final hotelRows = await hotelDBHelper
                                              .queryAllRows();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => Gestor(
                                                      hotelRows: hotelRows)));
                                        },
                                        child: const Text('Aceptar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                    ],
                                  );
                                });
                          }),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
