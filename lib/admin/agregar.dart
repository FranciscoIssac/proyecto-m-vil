import 'package:flutter/material.dart';
import 'package:proyecto_hoteles/admin/gestor.dart';
import 'package:proyecto_hoteles/constantes.dart' as cons;
import 'package:proyecto_hoteles/database_helper.dart';
import 'package:proyecto_hoteles/main.dart';

class Agregar extends StatefulWidget {
  const Agregar({super.key});

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final hotelName = TextEditingController();
  final description = TextEditingController();
  final rating = TextEditingController();
  final location = TextEditingController();
  final telephone = TextEditingController();
  final availavilityS = TextEditingController();
  final availavilityD = TextEditingController();
  final priceS = TextEditingController();
  final priceD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    bool validarFormatoTelefono(String telefono) {
      // Expresión regular para validar un número de teléfono con formato internacional
      RegExp regex = RegExp(r'^\+(?:[0-9] ?){5,14}[0-9]$');

      // Verificar si el número de teléfono coincide con el patrón
      if (regex.hasMatch(telefono)) {
        return true; // El número de teléfono es válido
      } else {
        return false; // El número de teléfono no es válido
      }
    }

    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color inicial
                    cons.blanco,
                    cons.colorPrincipal, // Color final
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.07),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Padding(
                        padding: EdgeInsets.all(size.height * 0.04),
                        child: Column(
                          children: [
                            Text("Agregar Hotel",
                                style: TextStyle(
                                  color: Color(0xFF1E1F22),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: hotelName,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Nombre del Hotel",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: description,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Descripción",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: location,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Ubicación",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: telephone,
                              obscureText: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Teléfono",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: availavilityS,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "No. de habitaciones simples",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: availavilityD,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "No. de habitaciones dobles",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: priceS,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Precio de habitaciones simples",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: priceD,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: cons.blanco,
                                labelText: "Precio de habitaciones dobles",
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            ElevatedButton(
                              onPressed: () async {
                                if (hotelName.text.isEmpty ||
                                description.text.isEmpty ||
                                location.text.isEmpty ||
                                telephone.text.isEmpty ||
                                availavilityS.text.isEmpty ||
                                availavilityD.text.isEmpty ||
                                priceS.text.isEmpty ||
                                priceD.text.isEmpty) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "Todos los campos son obligatorios"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else if (!validarFormatoTelefono(telephone.text)) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text(
                                            "El formato del número de teléfono no es válido\n- Debe emepzar con '+'\n- Debe tener entre 6 y 14 dígitos numéricos\n- Debe terminar con un dígito numérico"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("OK"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  Map<String, dynamic> row = {
                                    HotelTableHelper.columnName: hotelName.text,
                                    HotelTableHelper.columnDescription: description.text,
                                    HotelTableHelper.columnLocation: location.text,
                                    HotelTableHelper.columnTelephone: telephone.text,
                                    HotelTableHelper.columnAvailabilityS: availavilityS.text,
                                    HotelTableHelper.columnAvailabilityD: availavilityD.text,
                                    HotelTableHelper.columnPriceS: priceS.text,
                                    HotelTableHelper.columnPriceD: priceD.text,
                                  };
                                  final id = await hotelDBHelper.insert(row);
                                  debugPrint('inserted row id: $id');

                                  final hotelRows = await hotelDBHelper.queryAllRows();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Gestor(hotelRows: hotelRows,)));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: cons.gris,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  fixedSize: Size(size.width * 0.6, 25)),
                              child: const Text(
                                'Agregar',
                                style:
                                TextStyle(color: cons.blanco, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.07),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
