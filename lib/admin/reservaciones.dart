import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/database_helper.dart';
import 'package:proyecto_hoteles/main.dart';

class Reservaciones extends StatefulWidget {
  final List<Map<String, dynamic>> reservacionRows;

  const Reservaciones({required this.reservacionRows, Key? key}) : super(key: key);

  @override
  State<Reservaciones> createState() => _ReservacionesState();
}

class _ReservacionesState extends State<Reservaciones> {
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
          Center(
            child: Text("Elimina las reservaciones que han terminado",
                style: TextStyle(
                  color: Color(0xFF1E1F22),
                  fontSize: 20,
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.reservacionRows.length,
              itemBuilder: (context, index) {
                final reservacion = widget.reservacionRows[index];
                return ListTile(
                  title: Text('ID usuario: ${reservacion['userId']}\nID hotel: ${reservacion['hotelId']}'),
                  subtitle: Text('Fecha de inicio: ${reservacion['fechaInicio']}\nFecha de término: ${reservacion['fechaFin']}\nTipo de habitación: ${reservacion['tipoHabitacion']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /*IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),*/
                      reservacion['activa'] == 1 ?
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
                                          Map<String, dynamic> reservacionRow = {
                                            ReservacionTableHelper.columnId: reservacion['_id'],
                                            ReservacionTableHelper.columnActiva: 0,
                                          };
                                          final reservacionId = await reservacionDBHelper.update(reservacionRow);
                                          debugPrint('inserted row id: $reservacionId');
                                          final reservacionesRows = await reservacionDBHelper.queryAllRows();
                                          Navigator.of(context).pop();
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => Reservaciones(
                                                      reservacionRows: reservacionesRows,)));
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
                                })
                            ;
                          })
                          :
                          Container(),
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
